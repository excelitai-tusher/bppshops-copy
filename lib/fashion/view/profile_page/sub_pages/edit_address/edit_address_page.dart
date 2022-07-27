import 'dart:async';
//import 'package:classy_ui_design/order/order%20accepted.dart';

import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/peimary_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(23.748419032382532, 90.40278648441169),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
  static final Marker _kGooglePlexMarker = Marker(markerId:
  MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(23.748419032382532, 90.40278648441169),
  );
  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kLakeMarker'),
    infoWindow: InfoWindow(title: 'Lake'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(23.74841903230755, 90.40278648414726),
  );
  static final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [
        LatLng(23.74841903230755, 90.40278648414726),
        LatLng(23.74841903230755, 90.40278648414726),
      ]
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            //Navigator.pop(context);
            final status =
            Provider.of<PrimaryScreenState>(context, listen: false);
            status.setPrimaryState(true);
            final primaryPageState = Provider.of<PrimaryPageController>(context,listen: false);
            primaryPageState.setPrimaryPage(3);
          },
          child: Icon(Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text("Residential Address",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Roboto-Regular.ttf'
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Please Enter Your Current Address",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Roboto-Regular.ttf'
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  focusColor: Colors.grey,
                  fillColor: Colors.grey,
                  hoverColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  hintText: 'Street address & city',
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Roboto-Regular.ttf'),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  focusColor: Colors.grey,
                  fillColor: Colors.grey,
                  hoverColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  hintText: 'Apt, suite #',
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Roboto-Regular.ttf'),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  focusColor: Colors.grey,
                  fillColor: Colors.grey,
                  hoverColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  hintText: 'Post Code',
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Roboto-Regular.ttf'),
                ),
              ),
              SizedBox(height: 35,),
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: {
                        _kGooglePlexMarker,
                        _kLakeMarker,
                      },
                      polylines: {
                        _kPolyline,
                      },
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderAccepted()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Save Address",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
