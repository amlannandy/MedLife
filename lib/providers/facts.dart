import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Fact.dart';

class Facts with ChangeNotifier {

  List<Fact> _facts;

  Future<void> fetchAndSetFacts() async {

    List<Fact> temp = [];

    Firestore.instance.collection('healthy_habits').snapshots().listen(
      (data) => data.documents.forEach((doc) =>
        temp.add(Fact(
          id: doc['id'],
          name: doc['name'],
          imageUrl: doc['imageUrl'],
        ))
      ),
    );
    _facts = temp;
  }

  Fact findFactById(String id) {
    return _facts.firstWhere((fact) => fact.id == id);
  }

  List<Fact> get facts {
    return [..._facts];
  }


}