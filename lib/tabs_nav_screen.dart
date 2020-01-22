import 'package:flutter/material.dart';

import './ACCOUNT_SCREEN/account_screen.dart';
import './DOCTOR_SUPPORT_SCREEN/doctor_support_screen.dart';
import './HOME_PAGE_SCREEN/home_page_screen.dart';
import './TESTS_SCREEN/tests_screen.dart';

class TabsNavScreen extends StatefulWidget {
  @override
  _TabsNavScreenState createState() => _TabsNavScreenState();
}

class _TabsNavScreenState extends State<TabsNavScreen> {

  int _selectedIndex = 0;

  List _pages = [
    HomePageScreen(),
    TestsScreen(),
    DoctorSupportScreen(),
    AccountScreen(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Image.asset('assets/images/logo.png', height: 180),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: [
          //Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Home",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          //Tests
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop_chromebook),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Tests",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          //Doctor Support
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Support",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          //Account Details
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Account",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 1 ? FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
      ) : null,
    );
  }
}