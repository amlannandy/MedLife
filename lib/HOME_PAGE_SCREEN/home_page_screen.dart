import 'package:flutter/material.dart';

import '../GLOBAL_WIDGETS/Buttons/dark_button.dart';
import '../GLOBAL_WIDGETS/Buttons/dark_icon_button.dart';
import '../GLOBAL_WIDGETS/Buttons/light_button.dart';
import '../GLOBAL_WIDGETS/Buttons/light_icon_button.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "Testing Phase is going on...",
            style: Theme.of(context).textTheme.display1,
          ),
          Text(
            "Testing Phase is going on...",
            style: Theme.of(context).textTheme.display2,
          ),
          Text(
           "Testing Phase is going on...",
            style: Theme.of(context).textTheme.display3,
          ),
          DarkButton(text: "PRESS", function: () {}),
          LightButton(text: "PRESS", function: () {}),
          DarkIconButton(text: "DELETE", function: () {}, icon: Icons.delete,),
          LightIconButton(text: "DELETE", function: () {}, icon: Icons.delete),    
        ],
      ),
    );
  }
}