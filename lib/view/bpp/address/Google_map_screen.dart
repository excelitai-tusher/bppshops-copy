import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _makers ={};
  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _makers.add(
        Marker(markerId: MarkerId('id-1'),position: LatLng(23.81580,90.41486),
        ),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(

            target: LatLng(23.81580,90.41486),
            zoom: 15),),

    );
  }
}
