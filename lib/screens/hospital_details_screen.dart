import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hospitals.dart';
import '../widgets/success_button.dart';

class HospitalDetailsScreen extends StatelessWidget {

  static const routeName = '/hospital_details_screen';

  final imageUrl = "https://firebasestorage.googleapis.com/v0/b/medigo-b3817.appspot.com/o/hospitals%2Fapollo_hospital.jpeg?alt=media&token=e3fbad51-5ffa-4a04-8937-80e1b1b227d9";
  final address = "Plot no. 251, Sainik School Rd, Unit 15, Gajapati Nagar, Bhubaneswar, Odisha 751005";
  @override
  Widget build(BuildContext context) {

    // final hospitalId = ModalRoute.of(context).settings.arguments;
    // final currentHospital = Provider.of<Hospitals>(context).findHospitalById(hospitalId);

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
              child: Image.network(imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover)
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "ADDRESS",
                style: Theme.of(context).textTheme.display4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                address,
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            SuccessButton(
              icon: Icons.touch_app,
              text: "Make an Appointment",
              onPress: () {},
            )
          ],
        ),
      )
    );
  }
}