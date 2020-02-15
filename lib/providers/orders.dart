import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as Path;

import '../models/Order.dart';

class Orders with ChangeNotifier {

  List<Order> _orders = [];
  String currentImageUrl = "";

  Future<void> fetchAndSetOrders() async {

    List<Order> temp = [];

    Firestore.instance.collection('orders').snapshots().listen(
      (data) => data.documents.forEach((doc) =>
        temp.add(Order(
          id: doc['id'],
          name: doc['name'],
          medicines: doc['medcineList'],
          pharmacyName: doc['pharmacyName'],
          address: doc['address'],
          imageUrl: doc['imageUrl'],
        ))
      ),
    );
    if (temp != null)
      _orders = temp;
  }

  Future<void> placeOrder(String name, String pharmacyName, String medicine, String address) async {
    Firestore.instance.collection('orders').document().setData({
      'id' : DateTime.now().toString(),
      'name' : name,
      'pharmacyName' : pharmacyName,
      'medcineList' : medicine,
      'address' : address,
      'imageUrl' : currentImageUrl,
    });
      final newOrder = Order(
      id: DateTime.now().toString(),
      name: name,
      medicines: medicine,
      pharmacyName: pharmacyName,
      address: address,
      imageUrl: currentImageUrl,
    );
    _orders.add(newOrder);
    notifyListeners();
  }

  Future uploadPrescriptionImage(pickedImage) async {
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('prescription_images/${Path.basename(pickedImage.path)}}');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(pickedImage);
      await uploadTask.onComplete;
      Fluttertoast.showToast(msg: "Prescription uploaded!", backgroundColor: Colors.yellow, textColor: Colors.black);
      firebaseStorageRef.getDownloadURL().then((fileUrl) {
        currentImageUrl = fileUrl;
      });
      notifyListeners();
  }
  
  Order findOrderById(String id) {
    return _orders.firstWhere((order) => order.id == id);
  }

  List<Order> get orders {
    return [..._orders];
  }

}