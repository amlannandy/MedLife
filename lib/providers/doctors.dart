import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Doctor.dart';

class Doctors with ChangeNotifier {

  List<Doctor> _doctors;

  Future<void> fetchAndSetDoctors() async {

    List<Doctor> temp = [];

    Firestore.instance.collection('Doctors').snapshots().listen(
      (data) => data.documents.forEach((doc) =>
        temp.add(Doctor(
          id: doc['id'],
          name: doc['name'],
          imageUrl: doc['imageUrl'],
          field: doc['field'],
        ))
      ),
    );
    _doctors = temp;
  }

  Doctor findDoctorById(String id) {
    return _doctors.firstWhere((doctor) => doctor.id == id);
  }

  List<Doctor> get doctors {
    return [..._doctors];
  }


}