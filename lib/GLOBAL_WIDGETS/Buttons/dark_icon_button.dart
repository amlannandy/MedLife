import 'package:flutter/material.dart';

class DarkIconButton extends StatelessWidget {

  final String text;
  final Function function;
  final IconData icon;

  DarkIconButton({this.text, this.function, this.icon});

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      color: Theme.of(context).primaryColor,
      onPressed: function,
    );
  }
}