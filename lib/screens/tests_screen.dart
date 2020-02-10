import 'package:flutter/material.dart';

import '../widgets/test_card.dart';

class TestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.15,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "All Tests",
              style: Theme.of(context).textTheme.title,
            ),
            centerTitle: true,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(height: 5),
              TestCard(
                "Jaundice",
                "assets/images/jaundice.png",
              ),
              TestCard(
                "Melanoma",
                "assets/images/melanoma.jpg",
              ),
              TestCard(
                "Wrist Fractures",
                "assets/images/wrist_fractures.jpg",
              ),
            ]
          )
        )
      ],
    );
  }
}