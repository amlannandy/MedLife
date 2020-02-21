import 'package:flutter/material.dart';

import '../models/Order.dart';

class OrderCard extends StatelessWidget {

  final Order order;

  OrderCard(this.order);

  void showMedicineList(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return Container(
        height: 220,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green[700],
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.green[700],
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                      bottom: 15,
                    ),
                    alignment: Alignment.bottomRight,
                    child:CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.local_hospital, color: Colors.white),
                    ),
                  ),
                  Container(
                    color: Colors.green[700],
                    alignment: Alignment.centerRight,
                    width: 260,
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Order Details",
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
            ),
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
                    backgroundColor: Colors.amber,
                    child: Icon(Icons.content_paste, color: Colors.white),
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
                    "Medinces - " + order.medicines,
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
                    "Buyer - " + order.name,
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
      elevation: 5,
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () => showMedicineList(context),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 15,
                    bottom: 5,
                  ),
                  alignment: Alignment.bottomRight,
                  child:CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.adb, color: Colors.white),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                      top: 5,
                      bottom: 2.5,
                      left: 5
                    ),
                    child: Text(
                      order.name,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                      top: 5,
                      bottom: 2.5,
                      left: 5
                    ),
                    child: Text(
                      order.pharmacyName,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ],
              )
            ],
          ), 
        ],
      ),
    );
  }
}