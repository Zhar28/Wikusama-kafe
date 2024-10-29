import 'package:flutter/material.dart';
import 'package:ukk_kasir/pages/admin/dashboard.dart';
import 'package:ukk_kasir/pages/admin/editmenu.dart';
import 'package:ukk_kasir/pages/admin/edittable.dart';
import 'package:ukk_kasir/pages/admin/edituser.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    EditMenu(),
    Edittable(),
    EditUser()
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Edit Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_bar_outlined),
            label: 'Edit Table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Edit User',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 198, 124, 78),
        onTap: _onItemTapped,
      ),
    );
  }
}
