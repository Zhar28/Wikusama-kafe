import 'package:flutter/material.dart';
import 'package:ukk_kasir/pages/loginpage.dart';

class ManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        title: Text('Manager'),
      ),
      body: Center(
        child: Text('Welcome, Manager', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}