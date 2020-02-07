import 'package:flutter/material.dart';

class Location {

  final double latitude;
  final double longitude;
  final String address;

  Location(this.latitude, this.longitude, this.address);

}

class Hospital {

  final String id;
  final String name;
  final String imageUrl;
  final Location location;

  Hospital({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.location,
  });

}