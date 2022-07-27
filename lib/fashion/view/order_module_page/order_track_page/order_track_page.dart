import 'package:bpp_shop/fashion/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../../../Screen/fashion_home_page.dart';
import '../../../Screen/home_page copy.dart';

class OrderTrackPage extends StatefulWidget {
  @override
  State<OrderTrackPage> createState() => OrderTrackPageState();
}

class OrderTrackPageState extends State<OrderTrackPage> {
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
    return new Scaffold(
      body: Stack(
        children: [
          Container(
            child:  GoogleMap(
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
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.ellipsisV, color: Colors.black,),
                        onPressed: () {},
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(55.0), topLeft: Radius.circular(55.0)),
          border: Border.all(
            color: Colors.white70,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              Image(image: AssetImage("images/image 38.png"),
              ),
              SizedBox(height: 20,),
              Text("Tracking Order",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Roboto-Regular.ttf'
                ),
              ),
              SizedBox(height: 10,),
              Text("INVOICE: 25AK367",
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: 'Roboto-Regular.ttf'
                ),
              ),
              SizedBox(height: 15,),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Arrived in ', style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Roboto-Regular.ttf'),),
                    TextSpan(text: '5.32', style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'Roboto-Regular.ttf'),),
                    TextSpan(text: ' p.m.', style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Roboto-Regular.ttf'),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.orange,
                        ),
                        child: Image(
                          image: AssetImage("images/Vector (1).png"),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("Call Driver",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'Roboto-Regular.ttf'
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.orange,
                        ),
                        child: Image(
                          image: AssetImage("images/fi_message-circle.png"),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("Message",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'Roboto-Regular.ttf'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderAccepted()));
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        FashionHomePage()), (Route<dynamic> route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Back to shopping",
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

      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}