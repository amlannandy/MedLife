import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctors.dart';
import '../widgets/doctor_card.dart';

class DoctorsScreen extends StatelessWidget {

  static const routeName = '/doctors_screen';

  @override
  Widget build(BuildContext context) {

    final doctorsList = Provider.of<Doctors>(context).doctors;

    return Scaffold(
      body: CustomScrollView(
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
                "Our Doctors",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return DoctorCard(doctorsList[index]);
              },
              childCount: doctorsList.length,
              semanticIndexOffset: 2,
            ),
          ),
        ],
      ),
    );
  }
}