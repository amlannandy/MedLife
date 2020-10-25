import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar_deco.dart';
import '../widgets/fact_card.dart';
import '../providers/facts.dart';
import '../providers/hospitals.dart';
import '../providers/tests.dart';
import '../providers/doctors.dart';
import '../providers/orders.dart';
import '../providers/pharmacies.dart';
import '../providers/appointments.dart';
import '../providers/wearable_provider.dart';
import '../providers/LOCAL_DATA.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void didChangeDependencies() {
    Provider.of<Facts>(context).fetchAndSetFacts();
    Provider.of<Hospitals>(context).fetchAndSetHospitals();
    Provider.of<Doctors>(context).fetchAndSetDoctors();
    Provider.of<Pharmacies>(context).fetchAndSetPharmacies();
    Provider.of<Tests>(context).fetchAndSetTests();
    Provider.of<Orders>(context).fetchAndSetOrders();
    Provider.of<Appointments>(context).fetchAndSetAppointments();
    Provider.of<WearableProvider>(context).setPulseRate();
    Provider.of<WearableProvider>(context).setHaemoglobin();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: AppBarDeco("MedLife"),
          backgroundColor: Colors.transparent,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              return FactCard(localData[index]);
            },
            childCount: localData.length,
            semanticIndexOffset: 2,
          ),
        ),
      ],
    );
  }
}