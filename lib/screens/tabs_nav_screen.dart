import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import '../screens/home_screen.dart';
import '../screens/tests_screen.dart';
import '../screens/chat_bot_screen.dart';

class TabsNavScreen extends StatefulWidget {
  @override
  _TabsNavScreenState createState() => _TabsNavScreenState();
}

class _TabsNavScreenState extends State<TabsNavScreen> {

  int _selectedIndex = 1;

  List _pages = [
    TestsScreen(),
    HomeScreen(),
    ChatBotScreen(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showWearableStats (BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) {
      return Container(
        padding: EdgeInsets.all(10),
        height: 348,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(253, 200, 48, 1), Color.fromRGBO(243, 115, 53, 1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                ),
              ),
              child: Text(
                "WEARABLE STATS",
                style: Theme.of(context).textTheme.display3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Pulse Rate",
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Pulse rate value",
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.hourglass_empty,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Haemoglobin",
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Haemoglobin value",
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ],
            ),
          ],
        )
      );
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
          //Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Home",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.settings_input_svideo,
          color: Colors.white,
        ),
        onPressed: () => showWearableStats(context),
      ),
    );
  }

}