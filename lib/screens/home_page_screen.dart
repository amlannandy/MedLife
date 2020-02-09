import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/facts.dart';
import '../providers/hospitals.dart';
import '../widgets/fact_card.dart';


class HomePageScreen extends StatefulWidget {

  static const routeName = '/HomePageScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  void didChangeDependencies() {
    Provider.of<Hospitals>(context).fetchAndSetHospitals();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Center(child: Text("Hello"),);

    // final facts = Provider.of<Facts>(context).facts;

    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverAppBar(
    //       floating: true,
    //       expandedHeight: MediaQuery.of(context).size.height * 0.15,
    //       flexibleSpace: FlexibleSpaceBar(
    //         title: Text(
    //           "MediGO",
    //           style: Theme.of(context).textTheme.title,
    //         ),
    //         centerTitle: true,
    //       ),
    //     ),
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         (ctx, index) {
    //           return FactCard(facts[index]);
    //         },
    //         childCount: facts.length,
    //       ),
    //     ),
    //   ],
    // );
  }
}