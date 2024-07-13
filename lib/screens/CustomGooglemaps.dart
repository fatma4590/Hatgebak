// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hatgebak/Helper/placemodel.dart';
//
// class Customgooglemaps extends StatefulWidget {
//   static String id = 'momen';
//   const Customgooglemaps({super.key});
//
//   @override
//   State<Customgooglemaps> createState() => _CustomgooglemapsState();
// }
//
// class _CustomgooglemapsState extends State<Customgooglemaps> {
//   late CameraPosition intialcameraposition;
//   @override
//   void initState() {
//     intialcameraposition = CameraPosition(
//         target: LatLng(27.178711841386335, 31.185019126521677), zoom: 10);
//     // TODO: implement initState
//     initmarkers();
//     super.initState();
//   }
//
//   Set<Marker> markers = {};
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//         markers: markers, initialCameraPosition: intialcameraposition);
//   }
//
//   Future<Uint8List> getImageFromRawData(String image, double width) async {
//     var imageData = await rootBundle.load(image);
//     var imageCodec = await ui.instantiateImageCodec(
//         imageData.buffer.asUint8List(),
//         targetWidth: width.round());
//     var imageFrame = await imageCodec.getNextFrame();
//
//     var imageByteData =
//     await imageFrame.image.toByteData(format: ui.ImageByteFormat.png);
//     return imageByteData!.buffer.asUint8List();
//   }
//
//   void initmarkers() async {
//     var custommarker = BitmapDescriptor.fromBytes(
//         await getImageFromRawData('assets/image.png', 150));
//     var mymarkers = places
//         .map((placemodel) => Marker(
//         icon: custommarker,
//         position: placemodel.latLng,
//         infoWindow: InfoWindow(title: placemodel.name),
//         markerId: MarkerId(placemodel.id.toString())))
//         .toSet();
//     markers.addAll(mymarkers);
//     setState(() {});
//   }
// }
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Customgooglemaps extends StatefulWidget {
  static String id = 'momen';
  const Customgooglemaps({super.key});

  @override
  State<Customgooglemaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<Customgooglemaps> {
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};

  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: LatLng(27.178711841386335, 31.185019126521677),
      zoom: 10,
    );
    super.initState();
    initMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parking Areas')),
      body: GoogleMap(
        markers: markers,
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }

  Future<Uint8List> getImageFromRawData(String image, double width) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await ui.instantiateImageCodec(
      imageData.buffer.asUint8List(),
      targetWidth: width.round(),
    );
    var imageFrame = await imageCodec.getNextFrame();
    var imageByteData = await imageFrame.image.toByteData(format: ui.ImageByteFormat.png);
    return imageByteData!.buffer.asUint8List();
  }

  void initMarkers() async {
    var customMarker = BitmapDescriptor.fromBytes(
      await getImageFromRawData('assets/image.png', 150),
    );

    // Fetch locations from Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('parkingareas').get();
    List<QueryDocumentSnapshot> documents = snapshot.docs;

    documents.forEach((doc) {
      GeoPoint geoPoint = doc['location'];
      markers.add(
        Marker(
          icon: customMarker,
          position: LatLng(geoPoint.latitude, geoPoint.longitude),
          infoWindow: InfoWindow(title: doc['Name']),
          markerId: MarkerId(doc.id),
        ),
      );
    });

    setState(() {});
  }
}
