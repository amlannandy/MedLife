import 'package:flutter/material.dart';

import '../screens/tests_history_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/doctors_screen.dart';
import '../screens/map_screen.dart';
import '../screens/appointments_screen.dart';

class CustomDrawer extends StatelessWidget {

  Widget buildListTitle({ String title, String subtitle="", IconData icon, BuildContext context, Function onClick }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 12,
          color: Colors.black38,
          fontWeight: FontWeight.w100
        ),
      ),
      onTap: onClick,
      dense: true,
    );
  }
  Widget getDivider(){
    return Divider(color: Colors.black45, thickness: 0.2,);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          //...getLoginBackground(),
          Column(
            children: <Widget>[
              Container(
                height: 150,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(List: [Color.fromRGBO(241, 39, 17, 0.6), Color.fromRGBO(245, 175, 25, 0.6)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topRight,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        top: 27,
                        left: 5,
                      ),
                      child: Icon(
                        Icons.account_circle,
                        size: 50,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 45,),
                        Container(
                          padding: EdgeInsets.all(0.5),
                          child: Text(
                            "Amlan Nandy",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2.5),
                          child: Text(
                            "amlannandy5@gmail.com",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w100,
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
              SizedBox(height: 10),
              buildListTitle(
                title: "Our Doctors",
                subtitle: "Seek medical help from professionals",
                icon: Icons.supervisor_account,
                context: context,
                onClick: () {
                  Navigator.of(context).pushNamed(DoctorsScreen.routeName);
                }
              ),
              getDivider(),
              buildListTitle(
                title: "Health Network",
                subtitle: "Interact with Hospitals and Pharmacies",
                icon: Icons.add_location,
                context: context,
                onClick: () {
                  Navigator.of(context).pushNamed(MapScreen.routeName);
                }
              ),
              getDivider(),
              buildListTitle(
                title: "Medical History",
                subtitle: "View your past test results",
                icon: Icons.history,
                context: context,
                onClick: () {
                  Navigator.of(context).pushNamed(TestHistoryScreen.routeName);
                }
              ),
              getDivider(),
              buildListTitle(
                title: "Your Appointments",
                subtitle: "View your past and future appointments",
                icon: Icons.format_list_numbered,
                context: context,
                onClick: () {
                  Navigator.of(context).pushNamed(AppointmentsScreen.routeName);
                }
              ),
              getDivider(),
              buildListTitle(
                title: "Your Medicines",
                subtitle: "View your purchase history",
                icon: Icons.local_hospital,
                context: context,
                onClick: () {
                  Navigator.of(context).pushNamed(OrdersScreen.routeName);
                }
              ),
              getDivider(),
              buildListTitle(
                title: "My Family",
                subtitle: "Medical history of your loved ones",
                icon: Icons.home,
                context: context,
                onClick: () {}
              ),
              getDivider(),
              buildListTitle(
                title: "Settings",
                subtitle: "Personalize your Account",
                icon: Icons.settings,
                context: context,
                onClick: () {}
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getLoginBackground() {
    return [
      Positioned(
        bottom: -150,
        right: -150,
        child: Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            color: Color.fromRGBO(245, 155, 10, 0.2),
            shape: BoxShape.circle
          ),
        ),
      ),
      Positioned(
        bottom: -100,
        right: -180,
        child: Container(
          width: 550,
          height: 550,
          decoration: BoxDecoration(
            color: Color.fromRGBO(242, 171, 48, 0.2),
            shape: BoxShape.circle
          ),
        ),
      ),
      Positioned(
        bottom: -120,
        right: -120,
        child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            color: Color.fromRGBO(247, 152, 10, 0.1),
            shape: BoxShape.circle
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    ];
  }
}