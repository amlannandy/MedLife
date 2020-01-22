import 'package:flutter/material.dart';

class LightButton extends StatelessWidget {

  final String text;
  final Function function;

  LightButton({this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 1,
      ),
      onPressed: function,
      highlightedBorderColor: Colors.white54,
    );
  }
}