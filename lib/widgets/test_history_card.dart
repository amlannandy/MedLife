import 'package:flutter/material.dart';
import '../models/Test.dart';

class TestHistoryCard extends StatelessWidget {

  final TestData test;

  TestHistoryCard(this.test);

  void enlargeImage(BuildContext context) {
    showModalBottomSheet(context: context, builder: (ctx) {
      return Container(
        padding: const EdgeInsets.all(5),
        height: 240,
        width: double.infinity,
        child: Image.network(
          test.imageUrl,
          fit: BoxFit.cover,
          height: 230,
          width: double.infinity,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(
          test.test,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            color: Theme.of(context).primaryColor,
          ),
        ),
        subtitle: Text(
          test.result,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            color: Colors.grey,
          ),
        ),
        leading: Container(
          height: 300,
          child: InkWell(
            onTap: () => enlargeImage(context),
            child: CircleAvatar(
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: test.imageUrl,
                width: 50,
                height: 50,
                placeholderCacheHeight: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}