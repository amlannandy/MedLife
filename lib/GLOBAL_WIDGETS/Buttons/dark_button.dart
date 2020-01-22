import 'package:flutter/material.dart';

class DarkButton extends StatelessWidget {

  final String text;
  final Function function;

  DarkButton({this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: function,
    );
  }
}