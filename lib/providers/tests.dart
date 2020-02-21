import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as Path;

import '../models/Test.dart';

class Tests with ChangeNotifier {

  List<TestData> _tests = [];
  String currentImageUrl = "";

  Future<void> fetchAndSetTests() async {

    List<TestData> temp = [];

    Firestore.instance.collection('tests').snapshots().listen(
      (data) => data.documents.forEach((doc) =>
        temp.add(TestData(
          id: doc['id'],
          test: doc['test'],
          result: doc['result'],
          imageUrl: doc['imageUrl'],
        ))
      ),
    );
    if (temp != null)
      _tests = temp;
  }

  Future<void> uploadTest(String test, String result) async {
    Firestore.instance.collection('tests').document().setData({
      'id' : DateTime.now().toString(),
      'test' : test,
      'result' : result,
      'imageUrl' : currentImageUrl,
    });
      final newTest = TestData(
      id: DateTime.now().toString(),
      test: test,
      result: result,
      imageUrl: currentImageUrl,
    );
    _tests.add(newTest);
    notifyListeners();
  }

  Future uploadTestImage(pickedImage) async {
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('test_images/${Path.basename(pickedImage.path)}}');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(pickedImage);
      await uploadTask.onComplete;
      Fluttertoast.showToast(msg: "Image ready for testing!", backgroundColor: Colors.yellow, textColor: Colors.black);
      firebaseStorageRef.getDownloadURL().then((fileUrl) {
        currentImageUrl = fileUrl;
      });
      notifyListeners();
  }

  TestData findTestById(String id) {
    return _tests.firstWhere((test) => test.id == id);
  }

  List<TestData> get tests {
    return [..._tests];
  }
  

}