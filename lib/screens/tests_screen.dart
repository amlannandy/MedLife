import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/test_card.dart';
import '../providers/hospitals.dart';
import '../providers/tests.dart';

class TestsScreen extends StatefulWidget {
  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {

  @override
  void didChangeDependencies() {
    Provider.of<Hospitals>(context).fetchAndSetHospitals();
    Provider.of<Tests>(context).fetchAndSetTests();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.15,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Medigo",
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