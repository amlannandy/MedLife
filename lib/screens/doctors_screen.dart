import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctors.dart';
import '../widgets/doctor_card.dart';

class DoctorsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final doctorsList = Provider.of<Doctors>(context).doctors;

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.15,
          flexibleSpace: AppBarDeco(),
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
    );

  }
}

class AppBarDeco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromRGBO(253, 200, 48, 1), Color.fromRGBO(243, 115, 53, 1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Text(
        "Our Doctors",
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}