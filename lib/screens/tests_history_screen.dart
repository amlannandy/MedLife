import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tests.dart';
import '../widgets/test_history_card.dart';

class TestHistoryScreen extends StatelessWidget {

  static const routeName = '/test_history_screen';

  @override
  Widget build(BuildContext context) {

    final testsList = Provider.of<Tests>(context).tests;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.06,
            flexibleSpace: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: EdgeInsets.only(
                top: 15,
                bottom: 10,
              ),
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(241, 39, 17, 0.6), Color.fromRGBO(245, 175, 25, 0.6)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topRight,
                ),
              ),
              child: Text(
                "Medical History",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return TestHistoryCard(testsList[index]);
              },
              childCount: testsList.length,
              semanticIndexOffset: 2,
            ),
          ),
        ],
      ),
    );
  }
}