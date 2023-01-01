import 'dart:async';

import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapData extends StatefulWidget {
  const MapData({Key? key}) : super(key: key);

  @override
  State<MapData> createState() => MapDataState();
}

class MapDataState extends State<MapData> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 210.8334901395799,
      target: LatLng(33.651592, 73.156456),
      tilt: 70.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(app.radius.lightCurve)),
        child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}