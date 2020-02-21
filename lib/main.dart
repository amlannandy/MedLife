import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/testing_screens/pneumonia_testing_screen.dart';
import 'package:provider/provider.dart';

import './screens/tabs_nav_screen.dart';
import './screens/tests_history_screen.dart';
import './screens/appointment_form_screen.dart';
import './screens/testing_screens/melanoma_testing_screen.dart';
import './screens/testing_screens/pneumonia_testing_screen.dart';
import './screens/testing_screens/skin_diseases_testing_screen.dart';
import './screens/doctors_screen.dart';
import './screens/map_screen.dart';
import './screens/appointments_screen.dart';
import './screens/medicine_purchase_screen.dart';
import './screens/orders_screen.dart';
import './providers/hospitals.dart';
import './providers/facts.dart';
import './providers/tests.dart';
import './providers/doctors.dart';
import './providers/pharmacies.dart';
import './providers/wearable_provider.dart';
import './providers/call_and_messaging_service.dart';
import './providers/ml_providers/melanoma_provider.dart';
import './providers/ml_providers/pneumonia_provider.dart';
import './providers/ml_providers/skin_diseases_provider.dart';
import './providers/appointments.dart';
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
          value: Facts(),
        ),
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
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Appointments(),
        ),
        ChangeNotifierProvider.value(
          value: WearableProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MelanomaProvider(),
        ),
        ChangeNotifierProvider.value(
          value: PneumoniaProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SkinDiseasesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
          '/' : (ctx) => TabsNavScreen(),
          DoctorsScreen.routeName : (ctx) => DoctorsScreen(),
          MapScreen.routeName : (ctx) => MapScreen(),
          AppointmentFormScreen.routeName : (ctx) => AppointmentFormScreen(),
          MedicinePurchaseScreen.routeName : (ctx) => MedicinePurchaseScreen(),
          MelanomaTestingScreen.routeName : (ctx) => MelanomaTestingScreen(),
          PneumoniaTestingScreen.routeName : (ctx) => PneumoniaTestingScreen(),
          SkinDiseasesTestingScreen.routeName : (ctx) => SkinDiseasesTestingScreen(),
          OrdersScreen.routeName : (ctx) => OrdersScreen(),
          TestHistoryScreen.routeName : (ctx) => TestHistoryScreen(),
          AppointmentsScreen.routeName : (ctx) => AppointmentsScreen(),
        },
      ),
    );
  }
}