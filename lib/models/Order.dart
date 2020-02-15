import 'package:flutter/material.dart';

class Order {

  final String id;
  final String name;
  final String medicines;
  final String imageUrl;
  final String pharmacyName;
  final String address;

  Order({
    @required this.id,
    @required this.name,
    @required this.medicines,
    @required this.imageUrl,
    @required this.pharmacyName,
    @required this.address,
  });

}