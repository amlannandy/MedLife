import 'package:flutter/material.dart';

class AppBarDeco extends StatelessWidget {

  final String title;

  AppBarDeco(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}