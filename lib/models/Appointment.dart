import 'package:flutter/material.dart';

class Appointment {

  final String id;
  final String name;
  final String age;
  final String address;
  final String hospital;
  final String reason;
  final String gender;
  final String reserveBed;

  Appointment({
    @required this.id,
    @required this.name,
    @required this.age,
    @required this.reason,
    @required this.reserveBed,
    @required this.address,
    @required this.gender,
    @required this.hospital,
  });

}