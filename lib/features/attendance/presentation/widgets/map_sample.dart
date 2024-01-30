import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/services/location_helper.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  static Position? position; // U got the position details from the getMyCurrentLocation() method
  Future<void> getMyCurrentLocation() async {
    print("Loading.... ");
    await LocationHelper.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      bearing: 0,
      tilt: 0,
      zoom: 17);
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: position!=null
          ?buildMap()
          :const Center(child: CircularProgressIndicator(),) ,
    );
  }

  Widget buildMap(){
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      zoomControlsEnabled: false,
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);},
    );
  }
  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }
}

