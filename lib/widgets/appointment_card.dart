import 'package:flutter/material.dart';

import '../models/Appointment.dart';

class AppointmentCard extends StatelessWidget {

  final Appointment app;

  AppointmentCard(this.app);

  void showDetails(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return Container(
        height: 220,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 15,
                    bottom: 5,
                  ),
                  alignment: Alignment.bottomRight,
                  child:CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.hotel, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: 260,
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    app.hospital,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.end,
                  )
                ),
              ],
            ),
            Divider(color: Colors.grey[400], thickness: 0.4,),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 15,
                    bottom: 5,
                  ),
                  alignment: Alignment.bottomRight,
                  child:CircleAvatar(
                    backgroundColor: app.reserveBed == "Yes" ? Colors.green : Colors.redAccent,
                    child: app.reserveBed == "Yes" ? Icon(Icons.check_circle, color: Colors.white) : Icon(Icons.warning, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: 260,
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    "Bed reserved - " + app.reserveBed,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.end,
                  )
                ),
              ],
            ),
            Divider(color: Colors.grey[400], thickness: 0.4,),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 15,
                    bottom: 5,
                  ),
                  alignment: Alignment.bottomRight,
                  child:CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.account_circle, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: 260,
                  height: 50,
                  padding: const EdgeInsets.only(
                  top: 10,
                  ),
                  child: Text(
                    "Patient - " + app.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.end,
                  )
                ),
              ],
            ),
            Divider(color: Colors.grey[400], thickness: 0.4,),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () => showDetails(context),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 5,
                      bottom: 5,
                    ),
                    alignment: Alignment.bottomRight,
                    child:CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  width: 260,
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 10,
                  ),
                  child: Text(
                    app.hospital,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.end,
                  )
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(
                top: 2.5,
                right: 10,
                bottom: 10,
              ),
              child: Text(
                app.reason,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontFamily: "Montserrat",
                ),
                textAlign: TextAlign.right,
              )
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(
                    top: 2.5,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Case",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.right,
                  )
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(
                    top: 2.5,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Resolved",
                    style: TextStyle(
                      color: Colors.green[500],
                      fontSize: 14,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.right,
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}