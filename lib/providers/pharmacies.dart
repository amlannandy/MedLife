import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/Pharmacy.dart';

class Pharmacies with ChangeNotifier {

  List<Pharmacy> _pharmacies;
  String currentImageUrl;

  Future<void> fetchAndSetPharmacies() async {

    List<Pharmacy> temp = [];

    Firestore.instance.collection('pharmacies').snapshots().listen(
      (data) => data.documents.forEach((doc) =>
        temp.add(Pharmacy(
          id: doc['id'],
          name: doc['name'],
          imageUrl: doc['imageUrl'],
          latitude: doc['latitude'],
          longitude: doc['longitude'],
          address: doc['address'],
          phoneNo: doc['phoneNo'],
        )),
      ),
    );
    _pharmacies = temp;
  }

  Set<Marker> getPharmacyMarkers(BuildContext context, Function getPharmacyDetails) {
    Set<Marker> myMarkers = {};
    _pharmacies.forEach((pharmacy) => 
      myMarkers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(45),
          markerId: MarkerId(pharmacy.id),
          position: LatLng(
            pharmacy.latitude,
            pharmacy.longitude,
          ),
          infoWindow: InfoWindow(
            title: pharmacy.name,
          ),
          onTap: () {
            getPharmacyDetails(context, pharmacy);
          }
        )
      )
    );
    return myMarkers;
  }

  Pharmacy findpharmacyById(String id) {
    return _pharmacies.firstWhere((pharmacy) => pharmacy.id == id);
  }

  List<Pharmacy> get pharmacies {
    return [..._pharmacies];
  }


}