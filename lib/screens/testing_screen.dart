import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/success_button.dart';
import '../providers/tests.dart';

class TestingScreen extends StatefulWidget {

  static const routeName = '/testing_screen';

  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  File _pickedImage;

  void selectImage(File image) {
    setState(() {
      _pickedImage = image;
      //Provider.of<Tests>(context).uploadPic(_pickedImage);
    });
  }

  @override
  Widget build(BuildContext context) {

    final diseaseName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          diseaseName,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Column(
        children: <Widget>[
          ImageInput(selectImage),
          SizedBox(height: 20),
          SuccessButton(
            text: "Test",
            icon: Icons.local_hospital,
            onPress: () {},
          ),
        ],
      )
    );
  }
}