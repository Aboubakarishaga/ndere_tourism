import 'package:flutter/material.dart';
import 'package:ndere_tourism/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 10.0,
        centerTitle: true,
        leading:
        Padding(
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

        title: const Center(child: Text("Connexion", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 45, fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Se Connecter", style: TextStyle(color: Colors.deepPurple, fontSize: 50.0, fontStyle: FontStyle.italic),)),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action de connexion
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Se connecter"),
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
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
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
                        color: Colors.blue, fontWeight: FontWeight.bold),
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
