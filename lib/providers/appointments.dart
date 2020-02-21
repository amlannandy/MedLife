import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Appointment.dart';

class Appointments with ChangeNotifier {

  List<Appointment> _appointments = [];

  Future<void> fetchAndSetAppointments() async {

    List<Appointment> temp = [];

    Firestore.instance.collection('appointments').snapshots().listen(
      (data) => data.documents.forEach((doc) =>
        temp.add(Appointment(
          id: doc['id'],
          name: doc['name'],
          reason: doc['reason'],
          age: doc['age'].toString(),
          address: doc['address'],
          gender: doc['gender'],
          hospital: doc['hospitalName'],
          reserveBed: doc['reserveBed'],
        ))
      ),
    );
    if (temp != null)
      _appointments = temp;
  }

  Future<void> uploadAppointment(String name, String address, String reason, String age, String gender, String hospitalName, String reserveBed, String date) async {
    Firestore.instance.collection('appointments').document().setData({
      'name' : name,
      'address' : address,
      'reason' : reason,
      'age' : int.parse(age),
      'gender' : gender,
      'hospitalName' : hospitalName,
      'reserveBed' : reserveBed,
      'date' : date,
    });
      final newTest = Appointment(
      id: DateTime.now().toString(),
      name: name,
      reason: reason,
      address: address,
      age: age,
      gender: gender,
      hospital: hospitalName,
      reserveBed: reserveBed,
    );
    _appointments.add(newTest);
    notifyListeners();
  }

  Appointment findTestById(String id) {
    return _appointments.firstWhere((app) => app.id == id);
  }

  List<Appointment> get appointments {
    return [..._appointments];
  }
  

}