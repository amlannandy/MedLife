import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/success_button.dart';
import '../providers/tests.dart';
import '../providers/ml providers/melanoma_provider.dart';

class TestingScreen extends StatefulWidget {

  static const routeName = '/testing_screen';

  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {

  File _pickedImage;
  String imagePath = "";
  String result = "";

  @override
  void didChangeDependencies() {
    Provider.of<MelanomaProvider>(context).loadMelanomaModel();
    super.didChangeDependencies();
  }

  void selectImage(File image) {
    setState(() {
      _pickedImage = image;
      Provider.of<Tests>(context, listen: false).uploadTestImage(_pickedImage);
    });
  }

  void selectImagePath(String path) {
    imagePath = path;
  }

  void displayResult(String prediction) {
    setState(() {
      result = prediction;
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageInput(selectImage, selectImagePath),
            SizedBox(height: 20),
            SuccessButton(
              text: "Test",
              icon: Icons.local_hospital,
              onPress: () {
                Provider.of<MelanomaProvider>(context, listen: false).runMelanomaModel(imagePath, displayResult);
              },
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "Montserrat",
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Provider.of<Tests>(context, listen: false).uploadTest(diseaseName, result);
          Fluttertoast.showToast(
            msg: "Test saved!",
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }
}