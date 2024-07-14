import 'package:google_maps_flutter/google_maps_flutter.dart';

class placemodel {
  final int id;
  final String name;
  final LatLng latLng;

  placemodel({required this.id, required this.name, required this.latLng});
}

List<placemodel> places = [
  placemodel(
      id: 1,
      name: 'momen caffe',
      latLng: const LatLng(27.25821504920143, 31.13106060874228)),
  placemodel(
      id: 2,
      name: 'دير العدرا',
      latLng: LatLng(27.11773579445449, 31.16916943171447)),
  placemodel(
      id: 3,
      name: 'رويال',
      latLng: LatLng(27.186775971434002, 31.082308781156225)),
  placemodel(
      id: 4,
      name: 'Faculty of computer science',
      latLng: LatLng(27.186775971434002, 31.082308781156225)),
  placemodel(
      id: 5,
      name: 'Faculty of Commerce',
      latLng: LatLng(27.187150414597888, 31.173442224852753)),
  placemodel(
      id: 6,
      name: 'Momen  house',
      latLng: LatLng(27.189891082854153, 31.17873130995145)),
  placemodel(
      id: 7 ,
      name: 'Maha house',
      latLng: LatLng(27.19316472121821, 31.181700136225512)),


];