// Fichier principal de l'application
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Fonction principale - point d'entrée de l'app
void main() {
  runApp(const MyApp());
}

// Classe principale de l'application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Méthode build pour l'application entière
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Désactive la bannière de debug
      debugShowCheckedModeBanner: false,
      
      // Titre de l'application
      title: 'Santé Market',
      
      // Thème de l'application
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      
      // Premier écran à afficher
      home: const HomeScreen(),
    );
  }
}
// main() : Point de départ de toute app Dart

// runApp() : Lance l'application Flutter

// MaterialApp : Application avec design Material (style Google)