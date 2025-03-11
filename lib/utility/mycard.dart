import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String imageUrl;
  final String siteName;
  final String description;

  const MyCard({
    super.key,
    required this.imageUrl,
    required this.siteName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> touristSites = [
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
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
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
                    siteName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up, color: Colors.green),
                        onPressed: () {
                          // Action J'aime
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.thumb_down, color: Colors.red),
                        onPressed: () {
                          // Action Je n'aime pas
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
