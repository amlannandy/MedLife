import 'package:flutter/material.dart';
import 'package:healthcare_app/screens/appointment_form_screen.dart';
import 'package:provider/provider.dart';

import '../providers/hospitals.dart';
import '../widgets/success_button.dart';

class HospitalDetailsScreen extends StatelessWidget {

  static const routeName = '/hospital_details_screen';

  @override
  Widget build(BuildContext context) {

    final hospitalId = ModalRoute.of(context).settings.arguments;
    final currentHospital = Provider.of<Hospitals>(context).findHospitalById(hospitalId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apollo Hospital",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Image.network(currentHospital.imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover)
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Address",
                style: Theme.of(context).textTheme.display4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                currentHospital.address,
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            SuccessButton(
              icon: Icons.touch_app,
              text: "Make an Appointment",
              onPress: () {
                Navigator.of(context).pushNamed(AppointmentFormScreen.routeName, arguments: currentHospital.name);
              }
            )
          ],
        ),
      )
    );
  }
}