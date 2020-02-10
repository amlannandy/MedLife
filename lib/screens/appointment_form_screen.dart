import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/success_button.dart';


class AppointmentFormScreen extends StatefulWidget {

  static const routeName = '/appointment_form_screen';
  
  @override
  _AppointmentFormScreenState createState() => _AppointmentFormScreenState();
}


class _AppointmentFormScreenState extends State<AppointmentFormScreen> {

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _reasonController = TextEditingController();
  final _addressController = TextEditingController();

  String _gender = "";
  final _genderList = ["Male", "Female", "Other"];

  void _bookAppointment() async {

    if (_nameController.text.isEmpty || _ageController.text.isEmpty || _reasonController.text.isEmpty || _addressController.text.isEmpty || _gender.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Details", backgroundColor: Colors.orange.shade200);
      return;
    }

    try {
      if (int.parse(_ageController.text) < 0) 
        throw new Error();
    } catch (err) {
      Fluttertoast.showToast(msg: "Invalid Age", backgroundColor: Colors.red.shade100, textColor: Colors.black87);
      return;
    }

    Fluttertoast.showToast(msg: "Appointment booked!", backgroundColor: Colors.greenAccent, textColor: Colors.black);


    Firestore.instance.collection('appointments').document().setData({
      'name' : _nameController.text,
      'address' : _addressController.text,
      'reason' : _reasonController.text,
      'age' : int.parse(_ageController.text),
      'gender' : _gender,
    });

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Appointment",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  )
                ),
                icon: Icon(Icons.person),
                hintText: "Name of the Patient",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              controller: _nameController,
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  )
                ),
                icon: Icon(Icons.format_list_numbered),
                hintText: "Age",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              controller: _ageController,
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 5,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  )
                ),
                icon: Icon(Icons.location_city),
                hintText: "Address",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              controller: _addressController,
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 5,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  )
                ),
                icon: Icon(Icons.swap_vertical_circle),
                hintText: "Reason for Appointment",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              controller: _reasonController,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.supervisor_account,
                  color: Colors.grey,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      )
                  ),
                ),
              ],
            ),
            Column(
            mainAxisSize: MainAxisSize.max,
            children: _genderList.map((String v) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: RadioListTile<String>(
                  title: Text(
                    v,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    ),
                  ),
                  value: v,
                  groupValue: this._gender,
                  onChanged: (String s) {
                    setState(() { 
                      _gender = s; 
                    }); 
                  },
                  dense: true,
                ),
              );
            }).toList(),
          ),
          SuccessButton(
            icon: Icons.contact_phone,
            text: "Book Appointment",
            onPress: _bookAppointment,
          )
          ],
        ),
      ),
    );
  }
}