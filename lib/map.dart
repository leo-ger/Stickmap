import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maplibre_gl/mapbox_gl.dart';

class StickMap extends StatefulWidget {
  const StickMap({super.key});

  @override
  State<StickMap> createState() => _StickMapState();
}

class _StickMapState extends State<StickMap> {
  MaplibreMapController? mapController;
  var isLight = true;

  _onMapCreated(MaplibreMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    if (kDebugMode) {
      print('DEBUG: Style loaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaplibreMap(
      initialCameraPosition:
          const CameraPosition(target: LatLng(50.733334, 7.100000), zoom: 12.5),
      onMapCreated: _onMapCreated,
      onStyleLoadedCallback: _onStyleLoadedCallback,
      styleString:
          'https://api.maptiler.com/maps/openstreetmap/style.json?key=<API-KEY>',
      tiltGesturesEnabled: false,
    );
  }
}
