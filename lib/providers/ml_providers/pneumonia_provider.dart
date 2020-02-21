import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class PneumoniaProvider with ChangeNotifier {

  Future<void> loadModel() async {
    String res = await Tflite.loadModel(
      model: "assets/pneumonia_model/model.tflite",
      labels: "assets/pneumonia_model/labels.txt",
      numThreads: 1, // defaults to 1
    );
    print("Loading Pneumonia model..."); 
    print(res);
  }

  Future<void> runModel(String imagePath, Function function) async {

    var recognitions = await Tflite.runModelOnImage(
      path: imagePath, // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 2,    // defaults to 5
      threshold: 0.2,   // defaults to 0.1
      asynch: true      // defaults to true
    );
    print(recognitions[0]['label']);
    function(recognitions[0]['label']);
  }
  
  Future<void> closeModel() async {
    await Tflite.close();
    print("Model closed!");
  }

}