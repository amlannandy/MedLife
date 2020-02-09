import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/hospitals.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {

    Set<Marker> _hospitalMarkers = Provider.of<Hospitals>(context).getHospitalMarkers(context);

    return GoogleMap(
      initialCameraPosition: CameraPosition(
              target: LatLng(20.2961, 85.8245),
              zoom: 15,
            ),
            myLocationEnabled: true,
            mapType: MapType.satellite,
            compassEnabled: true,
            markers: _hospitalMarkers,
    );
  
  }
}