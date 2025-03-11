import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:ndere_tourism/favorite.dart';
import 'package:ndere_tourism/homepage.dart';

import 'loginscreen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const LoginScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = 0;
      });
    } else
    if (index == 1) {
      setState(() {
        _selectedIndex = 1;
      });
    } else
    if (index == 2) {
      setState(() {
        _selectedIndex = 2;
      });
    }
  }

  List<Marker> markers = [];
  List<LatLng> routePoints = [];
  Position? userPosition;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.deepPurple,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoris"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
        ],
      ),
    );
  }
}
