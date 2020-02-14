import 'package:flutter/material.dart';

class Pharmacy {

  final String id;
  final String name;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String address;
  final String phoneNo;

  Pharmacy({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.latitude,
    @required this.longitude,
    @required this.address,
    @required this.phoneNo,
  });

}