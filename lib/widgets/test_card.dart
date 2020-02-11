import 'package:flutter/material.dart';

import '../screens/testing_screen.dart';

class TestCard extends StatelessWidget {

  final String name;
  final String image;

  TestCard(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(TestingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.asset(image),
            Container(
              width: double.infinity,
              color: Colors.black26,
              padding: const EdgeInsets.all(10),
              child: Text(
                name,
                style: Theme.of(context).textTheme.display3,
              ),
            )
          ],
        )
      ),
    );
  }
}