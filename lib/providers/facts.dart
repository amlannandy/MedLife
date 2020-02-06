import 'package:flutter/material.dart';

import '../models/Fact.dart';

class Facts with ChangeNotifier {

  List<Fact> _facts = [];

  Future<void> fetchAndSetFacts() {

    

  }

  List<Fact> get facts {
    return [..._facts];
  }

}