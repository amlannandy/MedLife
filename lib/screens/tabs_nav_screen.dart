import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

import '../screens/tests_screen.dart';
import '../screens/chat_bot_screen.dart';

class TabsNavScreen extends StatefulWidget {
  @override
  _TabsNavScreenState createState() => _TabsNavScreenState();
}

class _TabsNavScreenState extends State<TabsNavScreen> {

  int _selectedIndex = 0;

  List _pages = [
    TestsScreen(),
    ChatBotScreen(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: [
          //Tests
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop_chromebook),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Tests",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          //Chatbot Support
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Support",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }

}