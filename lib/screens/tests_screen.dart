import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/test_card.dart';
import '../providers/hospitals.dart';
import '../providers/tests.dart';
import '../providers/doctors.dart';
import '../providers/orders.dart';
import '../providers/pharmacies.dart';

class TestsScreen extends StatefulWidget {
  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {

  @override
  void didChangeDependencies() {
    Provider.of<Hospitals>(context).fetchAndSetHospitals();
    Provider.of<Doctors>(context).fetchAndSetDoctors();
    Provider.of<Pharmacies>(context).fetchAndSetPharmacies();
    Provider.of<Tests>(context).fetchAndSetTests();
    Provider.of<Orders>(context).fetchAndSetOrders();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.06,
          flexibleSpace: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            padding: EdgeInsets.only(
              top: 15,
              bottom: 10,
            ),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color.fromRGBO(241, 39, 17, 0.6), Color.fromRGBO(245, 175, 25, 0.6)],
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
              ),
            ),
            child: Text(
              "Medigo",
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(height: 5),
              TestCard(
                "Pneumonia",
                "Check whether it's bacterial or viral",
                "assets/images/pneumonia.jpeg",
              ),
              TestCard(
                "Melanoma",
                "Check whether your case is benign or malignant",
                "assets/images/melanoma.jpg",
              ),
              TestCard(
                "Wrist Fractures",
                "Check if it requires a surgery",
                "assets/images/wrist_fractures.jpg",
              ),
            ]
          )
        )
      ],
    );
  }
}