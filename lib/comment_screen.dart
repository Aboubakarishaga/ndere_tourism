import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<Map<String, dynamic>> comments = [
    {"user": "Alice", "comment": "Magnifique endroit !", "date": "2025-03-07"},
    {"user": "Bob", "comment": "Très belle vue depuis la montagne.", "date": "2025-03-06"},
    {"user": "Charlie", "comment": "J’ai adoré visiter ce site.", "date": "2025-03-05"},
  ];

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
          "Commentaires des Utilisateurs",
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: comments.isEmpty
          ? const Center(child: Text("Aucun commentaire pour le moment."))
          : ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          var comment = comments[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(comment["user"][0]), // Première lettre du nom
              ),
              title: Text(comment["user"],  style: const TextStyle(color: Colors.blueAccent, fontSize: 18.0, fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment["comment"], style: const TextStyle(color: Colors.blueAccent, fontStyle: FontStyle.italic),),
                  const SizedBox(height: 5),
                  Text(comment["date"], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
