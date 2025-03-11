import 'package:flutter/material.dart';

class Myappbar extends StatelessWidget {
  final String text;

  const Myappbar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(shadowColor: Colors.black54,
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
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
