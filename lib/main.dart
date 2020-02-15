import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/tabs_nav_screen.dart';
import './screens/appointment_form_screen.dart';
import './screens/testing_screen.dart';
import './screens/doctors_screen.dart';
import './screens/map_screen.dart';
import './screens/medicine_purchase_screen.dart';
import './screens/orders_screen.dart';
import './providers/hospitals.dart';
import './providers/tests.dart';
import './providers/doctors.dart';
import './providers/pharmacies.dart';
import './providers/call_and_messaging_service.dart';
import './providers/ml%20providers/melanoma_provider.dart';
import './providers/orders.dart';

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
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: "MediGo",
        theme: ThemeData(
          primaryColor: Colors.deepOrange[200],
          accentColor: Colors.grey[100],
          primaryIconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 28,
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
          '/' : (ctx) => MedicinePurchaseScreen(),
          DoctorsScreen.routeName : (ctx) => DoctorsScreen(),
          MapScreen.routeName : (ctx) => MapScreen(),
          AppointmentFormScreen.routeName : (ctx) => AppointmentFormScreen(),
          MedicinePurchaseScreen.routeName : (ctx) => MedicinePurchaseScreen(),
          TestingScreen.routeName : (ctx) => TestingScreen(),
          OrdersScreen.routeName : (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}