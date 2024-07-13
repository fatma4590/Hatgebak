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
      latLng: LatLng(27.186775971434002, 31.082308781156225))
];