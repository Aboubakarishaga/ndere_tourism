import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> favoriteSites = [
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
  ];

  void removeFavorite(int index) {
    setState(() {
      favoriteSites.removeAt(index);
    });
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
          "Favorite",
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: favoriteSites.isEmpty
          ? const Center(child: Text("Aucun site ajouté en favori"))
          : ListView.builder(
        itemCount: favoriteSites.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    favoriteSites[index]["urlImage"]!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favoriteSites[index]["sitename"]!,
                      style: const TextStyle(color: Colors.blueAccent, fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        favoriteSites[index]["description"]!,
                        style: const TextStyle(color: Colors.blueAccent, fontStyle: FontStyle.italic),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => removeFavorite(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
