import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/tabs_nav_screen.dart';
import './screens/appointment_form_screen.dart';
import './screens/testing_screen.dart';
import './screens/medicine_purchase_screen.dart';
import './providers/hospitals.dart';
import './providers/tests.dart';
import './providers/doctors.dart';
import './providers/pharmacies.dart';
import './providers/call_and_messaging_service.dart';
import './providers/ml%20providers/melanoma_provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Hospitals(),
        ),
        ChangeNotifierProvider.value(
          value: Doctors(),
        ),
        ChangeNotifierProvider.value(
          value: Pharmacies(),
        ),
        ChangeNotifierProvider.value(
          value: Tests(),
        ),
        ChangeNotifierProvider.value(
          value: MelanomaProvider(),
        ),
      ],
      child: MaterialApp(
        title: "MediGo",
        theme: ThemeData(
          primaryColor: Colors.orange[500],
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
              color: Colors.orange[300],
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
          AppointmentFormScreen.routeName : (ctx) => AppointmentFormScreen(),
          MedicinePurchaseScreen.routeName : (ctx) => MedicinePurchaseScreen(),
          TestingScreen.routeName : (ctx) => TestingScreen(),
        },
      ),
    );
  }
}