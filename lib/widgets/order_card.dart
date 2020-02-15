import 'package:flutter/material.dart';

import '../models/Order.dart';

class OrderCard extends StatelessWidget {

  final Order order;

  OrderCard(this.order);

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
              Container(
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: order.imageUrl,
                  width: 100,
                  height: 100,
                  placeholderCacheHeight: 100,
                  fit: BoxFit.cover,
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