import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthcare_app/providers/orders.dart';
import 'package:healthcare_app/widgets/light_icon_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/success_button.dart';


class MedicinePurchaseScreen extends StatefulWidget {

  static const routeName = '/medicine_purchase_screen';
  
  @override
  _MedicinePurchaseScreenState createState() => _MedicinePurchaseScreenState();
}


class _MedicinePurchaseScreenState extends State<MedicinePurchaseScreen> {

  File _prescriptionImage;

  final _nameController = TextEditingController();
  final _medicineListController = TextEditingController();
  final _addressController = TextEditingController();

  Future _takePictureByCamera() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null)
      return;
    setState(() {
      _prescriptionImage = imageFile;
    });
    Provider.of<Orders>(context, listen: false).uploadPrescriptionImage(_prescriptionImage);
    Fluttertoast.showToast(msg: "Prescription uploaded!");
  }

  Future _takePictureByGallery() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null)
      return;
    setState(() {
      _prescriptionImage = imageFile;
    });
    Provider.of<Orders>(context, listen: false).uploadPrescriptionImage(_prescriptionImage);
    Fluttertoast.showToast(msg: "Prescription uploaded!");
  }


  void _purchaseMedince(String pharmacyName) async {

    if (_nameController.text.isEmpty || _medicineListController.text.isEmpty || _addressController.text.isEmpty || _prescriptionImage == null) {
      Fluttertoast.showToast(msg: "Please Enter Details", backgroundColor: Colors.orange.shade200);
      return;
    }

    Provider.of<Orders>(context, listen: false).placeOrder(
      _nameController.text,
      pharmacyName,
      _medicineListController.text,
      _addressController.text
    );

    Fluttertoast.showToast(msg: "Order placed! We'll send you the bill soon!", backgroundColor: Colors.greenAccent, textColor: Colors.black);
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    String pharmacyName = ModalRoute.of(context).settings.arguments;
    if (pharmacyName == null) {
      pharmacyName = "Harihar Store";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointment",
          style: Theme.of(context).textTheme.headline6,
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
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                LightIconButton(
                  icon: Icons.photo_size_select_actual,
                  text: "Gallery",
                  function: _takePictureByGallery,
                ), 
                LightIconButton(
                  icon: Icons.camera_alt,
                  text: "Camera",
                  function: _takePictureByCamera,
                ),  
              ],
            ),
            SizedBox(height: 25,),
            SuccessButton(
              icon: Icons.contact_phone,
              text: "Place Order",
              onPress: () {
                _purchaseMedince(pharmacyName);
              } 
            )
          ],
        ),
      ),
    );
  }
}