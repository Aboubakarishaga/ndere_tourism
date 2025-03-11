import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String rssUrl = "https://news.google.com/rss/search?q=tourisme%20dans%20la%20ville%20de%20ngaound%C3%A9r%C3%A9%20ngaound%C3%A9r%C3%A9&hl=fr&gl=FR&ceid=FR%3Afr";
  List<RssItem> newsItems = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(rssUrl));
      if (response.statusCode == 200) {
        final feed = RssFeed.parse(response.body);
        setState(() {
          newsItems = feed.items ?? [];
        });
      }
    } catch (e) {
      print("Erreur lors du chargement du flux RSS: $e");
    }
  }

  void _openArticle(BuildContext context, String url) async {
    if (url.isNotEmpty) {
      Uri uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossible d'ouvrir le lien")),
        );
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
          "Actualité",
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: newsItems.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final item = newsItems[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20.0,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(item.title ?? "Sans titre", style: const TextStyle(color: Colors.blueAccent, fontSize: 18.0, fontWeight: FontWeight.bold),),
                subtitle: Text(item.pubDate?.toLocal().toString() ?? "", style: const TextStyle(color: Colors.blueAccent, fontStyle: FontStyle.italic),),
                trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.blueAccent,),
                onTap: () {
                  _showOpenDialog(context, item.link ?? "");
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showOpenDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ouvrir l'article", style: TextStyle(color: Colors.blueAccent, fontSize: 25.0, fontWeight: FontWeight.bold),),
        content: const Text("Voulez-vous ouvrir cet article dans le navigateur ?", style: TextStyle(color: Colors.blueAccent,fontSize: 15.0, fontStyle: FontStyle.italic),),
        actions: [
          TextButton(
            child: const Text("Annuler"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Ouvrir", style: TextStyle(color: Colors.green),),
            onPressed: () {
              Navigator.pop(context);
              _openArticle(context, url);
            },
          ),
        ],
      ),
    );
  }
}
