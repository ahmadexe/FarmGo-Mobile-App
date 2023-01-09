import 'dart:async';

import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/field.dart';

class MapData extends StatefulWidget {
  final List<Field> fields;
  final Function onControllerInitialised;
  const MapData(
      {required this.fields, required this.onControllerInitialised, Key? key})
      : super(key: key);

  @override
  State<MapData> createState() => MapDataState();
}

class MapDataState extends State<MapData> {
  Set<Marker> fieldMarkers = {};

  @override
  initState() {
    super.initState();
    getMarkers();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(app.radius.lightCurve)),
        child: GoogleMap(
          mapType: MapType.normal,
          markers: fieldMarkers,
          initialCameraPosition:
              widget.fields.isEmpty ? _kGooglePlex : getInitCameraPosition(),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            widget.onControllerInitialised(_controller);
          },
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
        ),
      ),
    );
  }

  getMarkers() {
    for (var element in widget.fields) {
      Marker marker = Marker(
        infoWindow: InfoWindow(title: element.fieldName),
        position: LatLng(element.latitude, element.longitude),
        markerId: MarkerId(element.id),
      );
      fieldMarkers.add(marker);
    }
  }

  getInitCameraPosition() {
    return CameraPosition(
      target: LatLng(widget.fields[0].latitude, widget.fields[0].longitude),
      zoom: 14.4746,
    );
  }
}
