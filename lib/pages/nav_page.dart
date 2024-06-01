import 'login_page.dart';
import 'home_page.dart';
import 'antrian_page.dart';
import 'feedback_page.dart';
import 'package:flutter/material.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(),
    AntrianPage(),
    FeedbackPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome",
          style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              )
          )
        ],
      ),

      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled,color: Colors.white),
            label: 'Antrian',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star,color: Colors.white),
            label: 'Review',
          ),

        ],
      ),
    );
  }
}
