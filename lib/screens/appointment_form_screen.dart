import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthcare_app/widgets/light_icon_button.dart';

import '../widgets/success_button.dart';
import '../widgets/app_bar_deco.dart';

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
  DateTime _selectedDate;

  String _displayDate = "Current Date";

  String _gender = "";
  final _genderList = ["Male", "Female", "Other"];

  String _reserveBed = "";
  final _bedList = ["Yes", "No"];

  void _pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2020),
    ).then((date) {
        if (date == null) {
          return;
        }
        setState(() {
          _selectedDate = date;
          _displayDate = _selectedDate.toString();
        });
    });
  }

  void _bookAppointment(String hospitalName) async {

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
      'hospitalName' : hospitalName,
      'reserveBed' : _reserveBed,
      'date' : _selectedDate.toString(),
    });

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    final hospitalName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBarDeco(hospitalName),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          Row(
              children: <Widget>[
                Icon(
                  Icons.hotel,
                  color: Colors.grey,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Need a Bed?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      )
                  ),
                ),
              ],
            ),
            Row(
            children: _bedList.map((String v) {
              return Container(
                width: 150,
                child: RadioListTile<String>(
                  title: Text(
                    v,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    ),
                  ),
                  value: v,
                  groupValue: this._reserveBed,
                  onChanged: (String s) {
                    setState(() { 
                      _reserveBed = s; 
                    }); 
                  },
                  dense: true,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15),
            child: Text(
              _displayDate,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18
              )
            ),
          ),
          LightIconButton(
            function: _pickDate,
            icon: Icons.date_range,
            text: "Date of Appointment",
          ),
          SizedBox(height: 20),
          SuccessButton(
            icon: Icons.contact_phone,
            text: "Book Appointment",
            onPress: () => _bookAppointment(hospitalName),
          )
          ],
        ),
      ),
    );
  }
}