import 'package:flutter/material.dart';

import '../screens/testing_screens/melanoma_testing_screen.dart';
import '../screens/testing_screens/pneumonia_testing_screen.dart';
import '../screens/testing_screens/skin_diseases_testing_screen.dart';
import '../widgets/test_card.dart';

class TestsScreen extends StatefulWidget {
  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              "Our Tests",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(height: 5),
              TestCard(
                "Pneumonia",
                "Check whether it's bacterial or viral",
                "assets/images/pneumonia.jpeg",
                () {
                  Navigator.of(context).pushNamed(PneumoniaTestingScreen.routeName);
                }
              ),
              TestCard(
                "Melanoma",
                "Check whether your case is benign or malignant",
                "assets/images/melanoma.jpg",
                () {
                  Navigator.of(context).pushNamed(MelanomaTestingScreen.routeName);
                }
              ),
              TestCard(
                "Skin Diseases",
                "Check what that skin rash might be",
                "assets/images/skin_diseases.jpg",
                () {
                  Navigator.of(context).pushNamed(SkinDiseasesTestingScreen.routeName);
                }
              ),
            ]
          )
        )
      ],
    );
  }
}