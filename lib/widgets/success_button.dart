import 'package:flutter/material.dart';

class SuccessButton extends StatelessWidget {

  final String text;
  final IconData icon;
  final Function onPress;

  SuccessButton({
    @required this.text,
    @required this.icon,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed:onPress,
        padding: EdgeInsets.all(0.0),       
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color.fromRGBO(17, 153, 142, 1), Color.fromRGBO(56, 239, 125, 1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: double.infinity, minHeight: 50.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white54,
                ),
                SizedBox(width: 10,),
                Text(
                  text.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

