import 'package:flutter/material.dart';
import 'package:healthcare_app/providers/call_and_messaging_service.dart';

import '../screens/tests_screen.dart';
import '../screens/map_screen.dart';
import '../screens/chat_bot_screen.dart';
import '../screens/doctors_screen.dart';

class TabsNavScreen extends StatefulWidget {
  @override
  _TabsNavScreenState createState() => _TabsNavScreenState();
}

class _TabsNavScreenState extends State<TabsNavScreen> {

  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  int _selectedIndex = 0;

  List _pages = [
    TestsScreen(),
    MapScreen(),
    ChatBotScreen(),
    DoctorsScreen(),
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
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
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          //Map
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Map",
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
              "Doctors",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
        ],
      ),
      floatingActionButton: (_selectedIndex == 0 || _selectedIndex ==1) ? InkWell(
        onDoubleTap: () {
          _service.sendSms("8847817323");
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.warning,
            color: Colors.white,
            size: 30,
          ),
        ),
      ) : null,
    );
  }

}