import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.15,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "MediGO",
              style: Theme.of(context).textTheme.title,
            ),
            centerTitle: true,
          ),
        ),
      ],
    );
  }
}