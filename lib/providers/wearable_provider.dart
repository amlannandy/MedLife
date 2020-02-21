import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WearableProvider with ChangeNotifier {

  String pulseRate = "";
  String haemoglobin = "";

  Future<void> setPulseRate() async {
    final url = "https://agro-agres.firebaseio.com/pulseRate.json";
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as String;
      print(response.body);
      print("Pulse Rate - " + extractedData);
      pulseRate = extractedData + " PRA";
      print(pulseRate);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> setHaemoglobin() async {
    final url = "https://agro-agres.firebaseio.com/haemoglobin.json";
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as String;
      print("Haemoglobin - " +response.body);
      haemoglobin = extractedData + "%";
      print(haemoglobin);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }


  List returnValues () {
    return [pulseRate, haemoglobin];
  }

}