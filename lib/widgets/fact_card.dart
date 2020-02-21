import 'package:flutter/material.dart';

import '../models/Fact.dart';

class FactCard extends StatelessWidget {

  final Fact fact;

  FactCard(this.fact);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: fact.imageUrl,
                width: double.infinity,
                height: 300,
                placeholderCacheHeight: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              fact.name,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}