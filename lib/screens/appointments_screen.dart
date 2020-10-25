import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/appointments.dart';
import '../widgets/appointment_card.dart';

class AppointmentsScreen extends StatelessWidget {

  static const routeName = '/appointments_screen';

  @override
  Widget build(BuildContext context) {

    final appointmentList = Provider.of<Appointments>(context).appointments;

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
                "Appointments",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return AppointmentCard(appointmentList[index]);
              },
              childCount: appointmentList.length,
              semanticIndexOffset: 2,
            ),
          ),
        ],
      ),
    );
  }
}