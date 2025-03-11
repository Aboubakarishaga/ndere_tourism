import 'package:flutter/material.dart';
import 'package:flutter_google_map_polyline_point/flutter_polyline_point.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ndere_tourism/fullmap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> touristSites = [
    {
      "urlImage": "assets/montndere.jpg",
      "sitename": "Mont Ngaoundéré",
      "description":
          "L’unique Mont de la ville de Ngaoundéré est riche en histoire, en plus d’avoir la particularité, d’être au Cameroun, le seul a avoir à son sommet, une roche pesant des tonnes, à l’extrémité pointu, reposant sur le mont, à l’extrémité tout aussi pointue.",
      "latitude": 7.312646,
      "longitude": 13.566348
    },
    {
      "urlImage": "assets/lactison.jpg",
      "sitename": "Lac Tison",
      "description":
          "Situé à seulement 8 km au sud de Ngaoundéré, ce lac de cratère est entouré d'unevégétation luxuriante. Son eau limpide et son environnement paisible en font un excellentlieu pour la détente et la méditation. Il est réputé pour ses changements de couleur au cours de la journée, passant du bleu au vert en fonction de la lumière. Le lac est un lieu prisé pourles pique-niques et les excursions en famille.",
      "latitude": 7.253598,
      "longitude": 13.576827
    },
    {
      "urlImage": "assets/lacdang.jpg",
      "sitename": "Lac Dang",
      "description":
          "Situé sur la route de Garoua tirant son nom du village Dang qui signifie à côté en langue dii, dans la commune de Ngaoundéré 3è et à une dizaine de kilomètres du centre-ville Ngaoundéré capitale régionale de l’Adamaoua. Le Lac Dang s’étend sur plusieurs hectares à proximité de l’université de Ngaoundéré1.",
      "latitude": 7.43286,
      "longitude": 13.54846
    },
    {
      "urlImage": "assets/chutevina.jpg",
      "sitename": "Chutes de Vina",
      "description":
          "À 10 km de Ngaoundéré sur la route de Meiganga, les chutes de la Vina sont un autre joyaunaturel de la région. Elles offrent un spectacle majestueux, surtout après la saison despluies, où leur débit est à son apogée. La rivière Vina traverse un relief rocheux, créantplusieurs niveaux de cascades qui plongent dans des bassins naturels. L’endroit est idéalpour la randonnée et les pique-niques.",
      "latitude": 7.209162,
      "longitude": 13.585705
    },
    {
      "urlImage": "assets/lamidat.jpg",
      "sitename": "Lamidat de Ngaoundéré",
      "description":
          "Le Palais du Lamido est la résidence du chef traditionnel de Ngaoundéré. Il symbolisel'autorité et la culture du peuple Adamawa. Le palais est un bâtiment impressionnant,construit avec des matériaux traditionnels et décoré de motifs inspirés de l’art peul. Il abriteégalement une cour où se déroulent des cérémonies et des audiences. Les visiteurspeuvent assister à certaines célébrations culturelles et en apprendre davantage sur l’histoiredu lamidat.",
      "latitude": 7.28807,
      "longitude": 13.57205
    },
    {
      "urlImage": "assets/bois.jpg",
      "sitename": "Bois de Mardock",
      "description":
          "Il est situé entre le Collège de Mazenod et l’aéroport de Ngaoundéré ; au lieu-dit « Centrale Sonel », au terminus de la route Meiganga-Ngaoundéré, le jardin public est construit sur un espace qui s’étire sur 12 hectares",
      "latitude": 7.33310,
      "longitude": 13.56339
    },
    {
      "urlImage": "assets/village.jpeg",
      "sitename": "Village Artisanal",
      "description":
          "Le Village Artisanal Régional de Ngaoundéré est un lieu d’encadrement collectif des activités de production, d’exposition, de commercialisation et d’animation et de formation réservées aux artisans et entreprises artisanales de la Région de l'Adamaoua.",
      "latitude": 7.35240,
      "longitude": 13.57322
    },
    {
      "urlImage": "assets/aeroport.jpeg",
      "sitename": "Aeroport",
      "description":
          "L’aéroport de Ngaoundéré (code IATA : NGE • code OACI : FKKN) est situé dans la région de l'Adamaoua, au Cameroun. Selon la Cameroon Civil Aviation Authority, sa capacité est de 200 000 passagers par an",
      "latitude": 7.35851,
      "longitude": 13.56228
    },
    {
      "urlImage": "assets/place.jpg",
      "sitename": "Place du Cinquantenaire",
      "description":
          "Place du cinquantenaire, D21, Centre Commercial, Ngaoundéré I, Communauté urbaine de Ngaoundéré, Vina, Adamawa, BP : 806 NGAOUNDÉRÉ, Cameroon",
      "latitude": 7.317711,
      "longitude": 13.576623
    },
    {
      "urlImage":
          "https://ayilaa.s3.eu-west-1.amazonaws.com/attraction/4561/media/653bf1d09bcef_1698427344_Mont%20Ngaoundere%20(2).jpg",
      "sitename": "Mont Ngaoundéré",
      "description":
          "L’unique Mont de la ville de Ngaoundéré est riche en histoire, en plus d’avoir la particularité, d’être au Cameroun, le seul a avoir à son sommet, une roche pesant des tonnes, à l’extrémité pointu, reposant sur le mont, à l’extrémité tout aussi pointue.",
      "latitude": 7.312646,
      "longitude": 13.566348
    },
    {
      "urlImage":
          "https://mintoul.gov.cm/wp-content/uploads/2023/10/lac-tison.jpg",
      "sitename": "Lac Tison",
      "description":
          "Situé à seulement 8 km au sud de Ngaoundéré, ce lac de cratère est entouré d'unevégétation luxuriante. Son eau limpide et son environnement paisible en font un excellentlieu pour la détente et la méditation. Il est réputé pour ses changements de couleur au cours de la journée, passant du bleu au vert en fonction de la lumière. Le lac est un lieu prisé pourles pique-niques et les excursions en famille.",
      "latitude": 7.253598,
      "longitude": 13.576827
    },
    {
      "urlImage":
          "https://upload.wikimedia.org/wikipedia/commons/f/f7/Lac_Dang4.jpg",
      "sitename": "Lac Dang",
      "description":
          "Situé sur la route de Garoua tirant son nom du village Dang qui signifie à côté en langue dii, dans la commune de Ngaoundéré 3è et à une dizaine de kilomètres du centre-ville Ngaoundéré capitale régionale de l’Adamaoua. Le Lac Dang s’étend sur plusieurs hectares à proximité de l’université de Ngaoundéré1.",
      "latitude": 7.43286,
      "longitude": 13.54846
    },
    {
      "urlImage":
          "https://upload.wikimedia.org/wikipedia/commons/b/bd/Chute_de_la_Vina_10.jpg",
      "sitename": "Chutes de Vina",
      "description":
          "À 10 km de Ngaoundéré sur la route de Meiganga, les chutes de la Vina sont un autre joyaunaturel de la région. Elles offrent un spectacle majestueux, surtout après la saison despluies, où leur débit est à son apogée. La rivière Vina traverse un relief rocheux, créantplusieurs niveaux de cascades qui plongent dans des bassins naturels. L’endroit est idéalpour la randonnée et les pique-niques.",
      "latitude": 7.209162,
      "longitude": 13.585705
    },
    {
      "urlImage":
          "https://www.cameroon-tribune.cm//administrateur/photo/normal_3a25b4d.jpg",
      "sitename": "Lamidat de Ngaoundéré",
      "description":
          "Le Palais du Lamido est la résidence du chef traditionnel de Ngaoundéré. Il symbolisel'autorité et la culture du peuple Adamawa. Le palais est un bâtiment impressionnant,construit avec des matériaux traditionnels et décoré de motifs inspirés de l’art peul. Il abriteégalement une cour où se déroulent des cérémonies et des audiences. Les visiteurspeuvent assister à certaines célébrations culturelles et en apprendre davantage sur l’histoiredu lamidat.",
      "latitude": 7.28807,
      "longitude": 13.57205
    },
    {
      "urlImage":
          "https://z-p3-scontent-lhr8-1.xx.fbcdn.net/v/t1.6435-9/201977734_2096247197180216_4045298443022948702_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_ohc=uFeozk5CTjkQ7kNvgGoEl3n&_nc_oc=AdiaSiJlbS_iqYHhgvsfOOEul6qW2ShbZ_mMsi0zE44mS1Tw3TLHYWMLcUDGoAhwM1Y&_nc_zt=23&_nc_ht=z-p3-scontent-lhr8-1.xx&_nc_gid=AEzxRdd6-r-OB5YYZOZpvfY&oh=00_AYH4_sJaINMiPiNoVeaGYwqIjXSKeEcvlACvxu1ngHMRWQ&oe=67F39119",
      "sitename": "Bois de Mardock",
      "description":
          "Il est situé entre le Collège de Mazenod et l’aéroport de Ngaoundéré ; au lieu-dit « Centrale Sonel », au terminus de la route Meiganga-Ngaoundéré, le jardin public est construit sur un espace qui s’étire sur 12 hectares",
      "latitude": 7.33310,
      "longitude": 13.56339
    },
    {
      "urlImage":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1ABrIpnRs1xQr9YfpI5aIUfoyriI4dWHkoQ&s",
      "sitename": "Aeroport",
      "description":
          "L’aéroport de Ngaoundéré (code IATA : NGE • code OACI : FKKN) est situé dans la région de l'Adamaoua, au Cameroun. Selon la Cameroon Civil Aviation Authority, sa capacité est de 200 000 passagers par an",
      "latitude": 7.35851,
      "longitude": 13.56228
    },
    {
      "urlImage":
          "https://z-p3-scontent-lhr6-1.xx.fbcdn.net/v/t1.6435-9/91500042_1507713189392664_3156039421908746240_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=833d8c&_nc_ohc=-PlR1ZKKH_oQ7kNvgHCsMsT&_nc_oc=AdhRadWkqgOZ_3OMAGb732NVksiXP8QCcIFuXUm5xh8JFeVpbOfaokMtHNlHJG21T48&_nc_zt=23&_nc_ht=z-p3-scontent-lhr6-1.xx&_nc_gid=AA2KiIzXpMK-ajixGQtYVS7&oh=00_AYFsWYgZy5T4030ZOmA73RvwT_Zu2S9-IPQXaiC2I9bpVQ&oe=67F3B635",
      "sitename": "Place du Cinquantenaire",
      "description":
          "Place du cinquantenaire, D21, Centre Commercial, Ngaoundéré I, Communauté urbaine de Ngaoundéré, Vina, Adamawa, BP : 806 NGAOUNDÉRÉ, Cameroon",
      "latitude": 7.317711,
      "longitude": 13.576623
    },
    
  ];

  List<Marker> markers = [];
  List<LatLng> routePoints = [];
  TextEditingController searchController = TextEditingController();
  Position? userPosition;


  void _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      userPosition = position;
      markers.add(
        Marker(
          point: LatLng(position.latitude, position.longitude),
          child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  void _loadMarkers() {
    markers = touristSites.map((site) {
      return Marker(
        point: LatLng(site['latitude'], site['longitude']),
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      );
    }).toList();
    setState(() {});
  }


  Future<void> _getRouteToSite(double destLat, double destLng) async {
    if (userPosition == null) {
      _getCurrentLocation();
      return;
    }

    String apiKey = "TON_API_KEY_GOOGLE_MAPS"; //  Remplace par ta clé API
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${userPosition!.latitude},${userPosition!.longitude}&destination=$destLat,$destLng&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['routes'].isNotEmpty) {
        List<LatLng> points = PolylinePoints()
            .decodePolyline(data['routes'][0]['overview_polyline']['points'])
            .map((p) => LatLng(p.latitude, p.longitude))
            .toList();

        setState(() {
          routePoints = points;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(shadowColor: Colors.black54,
        elevation: 10.0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/montndere.jpg",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Text(
          "Homepage",
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un site...',
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: const MapOptions(
                  initialCenter: LatLng(7.3274, 13.5847), zoom: 13.0),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: markers),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routePoints,
                      color: Colors.blue,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: touristSites.length,
              itemBuilder: (context, index) {
                var site = touristSites[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      site['urlImage'].toString(),
                      width: 100,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(site['sitename']),
                  subtitle: Text(site['description']),
                  trailing: const Icon(Icons.directions),
                  onTap: () =>  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => FullMapScreen())),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
