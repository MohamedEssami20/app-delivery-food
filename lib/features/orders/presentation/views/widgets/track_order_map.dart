import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackOrderMap extends StatefulWidget {
  const TrackOrderMap({super.key});

  @override
  State<TrackOrderMap> createState() => TrackOrderMapState();
}

class TrackOrderMapState extends State<TrackOrderMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng? _currentLocation;
  final Set<Marker> _markers = {};

  static const CameraPosition _defaultCameraPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357), // Cairo
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    _getUserCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: _markers,
      initialCameraPosition: _defaultCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  // get user current location;
  Future<void> _getUserCurrentLocation() async {
    final position = await _determinePosition();

    _currentLocation = LatLng(position.latitude, position.longitude);

    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: _currentLocation!,
      ),
    );

    setState(() {});

    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(_currentLocation!, 16));
  }

  ///check permission;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }
}