import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthcare_app/screens/hospital_details_screen.dart';

import '../models/Hospital.dart';

class Hospitals with ChangeNotifier {

  List<Hospital> _hospitals;

  Future<void> fetchAndSetHospitals() async {

    List<Hospital> temp = [];
  //   Firestore.instance.collection("hospitals").document()
  // .setData({ 'title': 'title', 'author': 'author' });
    Firestore.instance.collection('hospitals').snapshots().listen(
      (data) => data.documents.forEach((doc) =>
        temp.add(Hospital(
          id: doc['id'],
          name: doc['name'],
          imageUrl: doc['imageUrl'],
          latitude: doc['latitude'],
          longitude: doc['longitude'],
          address: doc['address'],
        ))
      ),
    );
    _hospitals = temp;
  }

  Set<Marker> getHospitalMarkers(BuildContext context) {
    Set<Marker> myMarkers = {};
    _hospitals.forEach((hospital) => 
      myMarkers.add(
        Marker(
          markerId: MarkerId(hospital.id),
          position: LatLng(
            hospital.latitude,
            hospital.longitude,
          ),
          infoWindow: InfoWindow(
            title: hospital.name,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(HospitalDetailsScreen.routeName, arguments: hospital.id);
          }
        )
      )
    );

    return myMarkers;
  }

  Hospital findHospitalById(String id) {
    return _hospitals.firstWhere((hospital) => hospital.id == id);
  }

  List<Hospital> get hospitals {
    return [..._hospitals];
  }


}