import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ukk_kasir/pages/admin/navbar.dart';
import 'package:ukk_kasir/pages/cashierpage.dart';
import 'package:ukk_kasir/pages/create_account.dart';
import 'package:ukk_kasir/pages/manager/manager.dart';
import 'package:ukk_kasir/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _rememberMe = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    // Set default username for demo
    _usernameController.text = "";
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder for the login illustration
              Center(
                child: Container(
                  height: 240.0,
                  child: Image.asset(
                    'images/logo.png', // Replace with your image
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Log In Text
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              // Username Field
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  hintText: '8-12 Character',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Remember me Checkbox
              
              SizedBox(height: 20),
              // Log In Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _login(); //login process
                  },
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future <void> _login() async {
  String username = _usernameController.text;
  String password = _passwordController.text;

  if (username.isEmpty || password.isEmpty) {
    _showPopup(context, 'Username and Password cannot be empty.');
    return;
  }

  // Show loading indicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(child: CircularProgressIndicator());
    },
  );

  try {
    // Await the login call
    Map<String, dynamic>? result = await _authService.login(username, password, '50');

    Navigator.of(context).pop(); // Close loading indicator
    print("result: $result");
    if (result != null) {
      String role = result['user']['role'];
      if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else if (role == 'cashier') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => kasir()),
        );
      } else if (role == 'manager') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ManagerPage()),
        );
      } else {
        _showPopup(context, 'Unknown role. Please contact support.');
      }
    } else {
      _showPopup(context, 'Login failed. Please check your credentials.');
    }
  } catch (e) {
    Navigator.of(context).pop(); // Close loading indicator
    // Provide more context about the error
    _showPopup(context, 'An error occurred: ${e.toString()}. Please try again.');
  }
}
}

void _showPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Cautions!'),
        content: Container(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                message,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

