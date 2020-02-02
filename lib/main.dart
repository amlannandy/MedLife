import 'package:flutter/material.dart';

import './screens/tabs_nav_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MediGo",
      theme: ThemeData(
        primaryColor: Colors.orange[900],
        accentColor: Colors.amber,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
          ),
          display1: TextStyle(
            color: Colors.orange[900],
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
          display2: TextStyle(
            color: Colors.amber,
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
          display3: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
          display4: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        highlightColor: Colors.deepOrange[200],
        hintColor: Colors.deepOrange[900]
      ),
      routes: {
        '/' : (ctx) => TabsNavScreen(),
      },
    );
  }
}