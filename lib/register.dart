import 'package:flutter/material.dart';
import 'package:ndere_tourism/loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  DateTime? _selectedDate;

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              "Inscription",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.blueAccent,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              "S'incrire",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 50.0,
                  fontStyle: FontStyle.italic),
            )),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Nom",
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Colors.blueAccent,),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Colors.blueAccent,),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              readOnly: true,
              onTap: _pickDate,
              decoration: InputDecoration(
                labelText: _selectedDate == null
                    ? "Date de naissance"
                    : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                labelStyle: const TextStyle(color: Colors.blueAccent),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.calendar_today, color: Colors.blueAccent,),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Mot de passe",
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.blueAccent,),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirmer le mot de passe",
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.blueAccent,),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action pour l'inscription
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,elevation: 20.0,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("S'inscrire", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const Text(
                " Déjà Inscrit ? Se connecter",
                style:
                    TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
