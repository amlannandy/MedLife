import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';


class MelanomaProvider with ChangeNotifier {

  Future<void> loadMelanomaModel() async {
    String res = await Tflite.loadModel(
      model: "assets/melanoma_model/melanoma_model.tflite",
      labels: "assets/melanoma_model/dict.txt",
      numThreads: 1 // defaults to 1
    );
    print(res);
  }

  Future<void> runMelanomaModel(String imagePath, Function function) async {
    var recognitions = await Tflite.runModelOnImage(
      path: imagePath, // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 2,    // defaults to 5
      threshold: 0.2,   // defaults to 0.1
      asynch: true      // defaults to true
    );
    print(recognitions);
    //Fluttertoast.showToast(msg: recognitions[0]['label'], backgroundColor: Colors.green[900], textColor: Colors.white);
    //function(recognitions[0]['label']);
  }
  
  Future<void> closeMelanomaModel() async {
    await Tflite.close();
    print("Model closed!");
  }

}