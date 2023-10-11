import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
import 'package:location/location.dart';

class StickMap extends StatefulWidget {
  const StickMap({super.key});

  @override
  State<StickMap> createState() => _StickMapState();
}



class _StickMapState extends State<StickMap> {
  MaplibreMapController? mapController;
  var isLight = true;
  bool _myLocationEnabled = false;
  late final String apiKey;

  @override
  initState() {
    super.initState();
    apiKey = dotenv.env['MAPTILER_API_KEY']!;
  }

  _onMapCreated(MaplibreMapController controller) {
    mapController = controller;
    setState(() {
      _myLocationEnabled = true;
    });
  }

  _onStyleLoadedCallback() {
    if (kDebugMode) {
      print('DEBUG: Style loaded');
    }
  }

  void _updateLocation() async {
    final location = Location();
    final hasPermissions = await location.hasPermission();
    if (hasPermissions != PermissionStatus.granted) {
      await location.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    // API-key, included in gitignor

    return MaplibreMap(
      initialCameraPosition:
      //LatLng(50.733334, 7.100000)
          const CameraPosition(target: LatLng(50.733334, 7.100000), zoom: 12.5),
      onMapCreated: _onMapCreated,
      onStyleLoadedCallback: _onStyleLoadedCallback,
      styleString:
          'https://api.maptiler.com/maps/openstreetmap/style.json?key=$apiKey',
      tiltGesturesEnabled: false,
      myLocationEnabled: _myLocationEnabled, // Enabled on map creation
      myLocationTrackingMode: MyLocationTrackingMode.Tracking,
      onUserLocationUpdated: (userLocation) {
        print('User location updated: ${userLocation.position}');
      },
    );
  }
}

class SimpleMap extends StatefulWidget {
  const SimpleMap({super.key});

  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  @override
  Widget build(BuildContext context) {
    return MaplibreMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(-33.852, 151.211),
        zoom: 11.0,
      ),
      styleString: '''{
        "version": 8,
        "sources": {
          "OSM": {
            "type": "raster",
            "tiles": [
              "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
              "https://b.tile.openstreetmap.org/{z}/{x}/{y}.png",
              "https://c.tile.openstreetmap.org/{z}/{x}/{y}.png"
            ],
            "tileSize": 256,
            "attribution": "© OpenStreetMap contributors",
            "maxzoom": 18
          }
        },
        "layers": [
          {
            "id": "OSM-layer",
            "source": "OSM",
            "type": "raster"
          }
        ]
      }''',
    );
  }
}

