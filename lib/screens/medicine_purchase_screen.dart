import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/success_button.dart';


class MedicinePurchaseScreen extends StatefulWidget {

  static const routeName = '/medicine_purchase_screen';
  
  @override
  _MedicinePurchaseScreenState createState() => _MedicinePurchaseScreenState();
}


class _MedicinePurchaseScreenState extends State<MedicinePurchaseScreen> {

  final _nameController = TextEditingController();
  final _medicineListController = TextEditingController();
  final _addressController = TextEditingController();
  String prescriptionUrl = "";


  void _purchaseMedince(String pharmacyName) async {

    if (_nameController.text.isEmpty || _medicineListController.text.isEmpty || _addressController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Details", backgroundColor: Colors.orange.shade200);
      return;
    }

    //To implement prescription upload

    Fluttertoast.showToast(msg: "Order placed! We'll send you the bill soon!", backgroundColor: Colors.greenAccent, textColor: Colors.black);


    Firestore.instance.collection('medicine_purchases').document().setData({
      'name' : _nameController.text,
      'address' : _addressController.text,
      'medcineList' : _medicineListController.text,
      'prescriptionUrl' : prescriptionUrl,
      'storeName' : pharmacyName,
    });

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    final pharmacyName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointment",
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
                hintText: "Name",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              controller: _nameController,
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
                hintText: "Medicine List",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              controller: _medicineListController,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.attach_file,
                  color: Colors.grey,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(18),
                  child: Text(
                      "Attach Prescription",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      )
                  ),
                ),
              ],
            ),
          SuccessButton(
            icon: Icons.contact_phone,
            text: "Place Order",
            onPress: () => _purchaseMedince(pharmacyName),
          )
          ],
        ),
      ),
    );
  }
}