import 'package:flutter/material.dart';

import '../models/Fact.dart';

class FactCard extends StatelessWidget {

  final Fact fact;

  FactCard(this.fact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      child: Card(
        elevation: 10,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.network(fact.imageUrl),
            Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                fact.title,
                style: Theme.of(context).textTheme.display3,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}