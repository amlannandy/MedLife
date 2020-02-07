import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/tabs_nav_screen.dart';
import './screens/home_page_screen.dart';
import './providers/facts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Facts(),
        )
      ],
      child: MaterialApp(
        title: "MediGo",
        theme: ThemeData(
          primaryColor: Colors.orange[900],
          accentColor: Colors.orange[300],
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
          HomePageScreen.routeName : (ctx) => HomePageScreen(),
        },
      ),
    );
  }
}