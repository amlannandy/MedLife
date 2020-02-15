import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/Pharmacy.dart';
import '../models/Hospital.dart';
import '../providers/hospitals.dart';
import '../providers/pharmacies.dart';
import '../widgets/success_button.dart';
import '../widgets/app_bar_deco.dart';
import '../screens/medicine_purchase_screen.dart';
import '../screens/appointment_form_screen.dart';

class MapScreen extends StatefulWidget {

  static const routeName = 'map_screen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {

    Set<Marker> _hospitalMarkers = Provider.of<Hospitals>(context).getHospitalMarkers(context, showHospitalDetails);
    Set<Marker> _pharmacyMarkers = Provider.of<Pharmacies>(context).getPharmacyMarkers(context, showPharmacyDetails);

    _hospitalMarkers.addAll(_pharmacyMarkers);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBarDeco("Health Network"),
        backgroundColor: Colors.transparent,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(20.2961, 85.8245),
          zoom: 15,
        ),
        myLocationEnabled: true,
        mapType: MapType.satellite,
        compassEnabled: true,
        markers: _hospitalMarkers,
      ),
    );
  }

  void showHospitalDetails(BuildContext context, Hospital currentHospital) {

    showModalBottomSheet(context: context, backgroundColor: Colors.transparent, isScrollControlled: true, builder: (_) {
      return Container(
        padding: EdgeInsets.all(10),
        height: 348,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(253, 200, 48, 1), Color.fromRGBO(243, 115, 53, 1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                ),
              ),
              child: Text(
                currentHospital.name,
                style: Theme.of(context).textTheme.display3,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: currentHospital.imageUrl,
                  width: double.infinity,
                  height: 200,
                  placeholderCacheHeight: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    currentHospital.address,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ],
            ),
            SuccessButton(
              icon: Icons.playlist_add_check,
              text: "Book an Appointment",
              onPress: () {
                Navigator.of(context).pushNamed(AppointmentFormScreen.routeName, arguments: currentHospital.name);
              },
            )
          ],
        )
      );
    });
  }

  void showPharmacyDetails(BuildContext context, Pharmacy currentPharmacy) {

    showModalBottomSheet(context: context, backgroundColor: Colors.transparent, isScrollControlled: true, builder: (_) {
      return Container(
        padding: EdgeInsets.all(10),
        height: 348,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(195, 20, 50, 1), Color.fromRGBO(36, 11, 54, 1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                ),
              ),
              child: Text(
                currentPharmacy.name,
                style: Theme.of(context).textTheme.display3,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: currentPharmacy.imageUrl,
                  width: double.infinity,
                  height: 200,
                  placeholderCacheHeight: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    currentPharmacy.address,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ],
            ),
            SuccessButton(
              icon: Icons.playlist_add_check,
              text: "Purchase Medince",
              onPress: () {
                Navigator.of(context).pushNamed(MedicinePurchaseScreen.routeName, arguments: currentPharmacy.name);
              },
            )
          ],
        )
      );
    });
  }
}
