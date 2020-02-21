import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../widgets/image_input.dart';
import '../../widgets/success_button.dart';
import '../../widgets/app_bar_deco.dart';
import '../../providers/tests.dart';
import '../../providers/ml_providers/pneumonia_provider.dart';

class PneumoniaTestingScreen extends StatefulWidget {

  static const routeName = '/pneumonia_testing_screen';

  @override
  _PneumoniaTestingScreenState createState() => _PneumoniaTestingScreenState();
}

class _PneumoniaTestingScreenState extends State<PneumoniaTestingScreen> {

  File _pickedImage;
  String imagePath = "";
  String result = "";

  @override
  void didChangeDependencies() {
    Provider.of<PneumoniaProvider>(context).loadModel();
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

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBarDeco("Pneumonia"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageInput(selectImage, selectImagePath),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: SuccessButton(
                text: "Test",
                icon: Icons.local_hospital,
                onPress: () {
                  Provider.of<PneumoniaProvider>(context, listen: false).runModel(imagePath, displayResult);
                },
              ),
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
          Provider.of<PneumoniaProvider>(context, listen: false).closeModel();
          Provider.of<Tests>(context, listen: false).uploadTest("Pneumonia", result);
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