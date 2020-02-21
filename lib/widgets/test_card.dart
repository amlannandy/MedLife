import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {

  final String name;
  final String subtitle;
  final String image;
  final Function function;

  TestCard(this.name, this.subtitle, this.image, this.function);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 10,
          right: 10,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.asset(image, height: 200, width: double.infinity, fit: BoxFit.cover,),
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: Colors.black45,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    bottom: 2.5,
                  ),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.display3,
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black45,
                  padding: const EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}