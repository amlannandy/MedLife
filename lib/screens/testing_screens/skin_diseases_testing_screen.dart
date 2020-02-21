import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../widgets/image_input.dart';
import '../../widgets/success_button.dart';
import '../../widgets/app_bar_deco.dart';
import '../../providers/tests.dart';
import '../../providers/ml_providers/skin_diseases_provider.dart';

class SkinDiseasesTestingScreen extends StatefulWidget {

  static const routeName = '/skin_diseases_testing_screen';

  @override
  _SkinDiseasesTestingScreenState createState() => _SkinDiseasesTestingScreenState();
}

class _SkinDiseasesTestingScreenState extends State<SkinDiseasesTestingScreen> {

  File _pickedImage;
  String imagePath = "";
  String result = "";

  @override
  void didChangeDependencies() {
    Provider.of<SkinDiseasesProvider>(context).loadModel();
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
        flexibleSpace: AppBarDeco("Skin Diseases"),
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
                  Provider.of<SkinDiseasesProvider>(context, listen: false).runModel(imagePath, displayResult);
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
          Provider.of<SkinDiseasesProvider>(context, listen: false).closeModel();
          Provider.of<Tests>(context, listen: false).uploadTest("Skin Diseases", result);
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