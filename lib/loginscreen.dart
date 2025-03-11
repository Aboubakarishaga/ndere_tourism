import 'package:flutter/material.dart';
import 'package:ndere_tourism/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              "Se Connecter",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.blueAccent),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Se Connecter",  style: const TextStyle(color: Colors.blueAccent, fontSize: 18.0, fontWeight: FontWeight.bold),)),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Colors.blueAccent,),
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.blueAccent,),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action de connexion
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,elevation: 20.0,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Se connecter", style: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Action mot de passe oublié
                  },
                  child: const Text(
                    "Mot de passe oublié ?         ",
                      style: const TextStyle(color: Colors.blueAccent, fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
                  },
                  child: const Text(
                    " Créer un compte",
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
