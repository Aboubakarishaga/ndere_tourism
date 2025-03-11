import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class FullMapScreen extends StatefulWidget {
  @override
  _FullMapScreenState createState() => _FullMapScreenState();
}

class _FullMapScreenState extends State<FullMapScreen> {
  late GoogleMapController mapController;
  LatLng _userPosition = LatLng(7.35, 13.56); // Position par défaut (Ngaoundéré)

  // Liste des sites touristiques
  final List<Marker> _touristSpots = [
    Marker(
      markerId: MarkerId("site1"),
      position: LatLng(7.3667, 13.5667), // Ex: Mont Ngaoundéré
      infoWindow: InfoWindow(title: "Mont Ngaoundéré", snippet: "Vue panoramique"),
    ),
    Marker(
      markerId: MarkerId("site2"),
      position: LatLng(7.3833, 13.5833), // Ex: Chutes de la Vina
      infoWindow: InfoWindow(title: "Chutes de la Vina", snippet: "Cascade magnifique"),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _userPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carte des Sites Touristiques")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _userPosition, zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: {
          Marker(
            markerId: MarkerId("user"),
            position: _userPosition,
            infoWindow: InfoWindow(title: "Vous êtes ici"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
          ..._touristSpots,
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
