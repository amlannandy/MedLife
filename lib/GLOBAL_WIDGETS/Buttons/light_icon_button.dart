import 'package:flutter/material.dart';

class LightIconButton extends StatelessWidget {

  final String text;
  final Function function;
  final IconData icon;

  LightIconButton({this.text, this.function, this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      label: Text(
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