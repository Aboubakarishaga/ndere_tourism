import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:ndere_tourism/favorite.dart';
import 'package:ndere_tourism/homepage.dart';
import 'package:ndere_tourism/news.dart';

import 'comment_screen.dart';
import 'loginscreen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;

  final screens = [
    const HomeScreen(),
    CommentsScreen(),
    const NewsScreen(),
    const FavoritesScreen(),
    const LoginScreen(),
  ];

  List<Marker> markers = [];
  List<LatLng> routePoints = [];
  Position? userPosition;

  @override
  Widget build(BuildContext context) {

    final items = [
      const Icon(Icons.home, size: 30.0,),
      const Icon(Icons.comment, size: 30.0,),
      const Icon(Icons.article, size: 30.0,),
      const Icon(Icons.favorite, size: 30.0,),
      const Icon(Icons.person, size: 30.0,),
    ];

    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 100),
          backgroundColor: Colors.transparent,
          color: Colors.blueAccent,
          index: index,
          height: 60.0,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
