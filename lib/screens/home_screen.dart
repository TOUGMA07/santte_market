// Import des packages nécessaires
import 'package:flutter/material.dart';

// Notre classe principale pour l'écran d'accueil
class HomeScreen extends StatelessWidget {
  // Constructeur de la classe
  const HomeScreen({super.key});

  // Méthode build qui décrit comment l'écran doit être affiché
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre d'en-tête de l'application
      appBar: AppBar(
        title: const Text('Santé Market 🏥'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      
      // Corps principal de l'écran
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône médicale
            const Icon(
              Icons.medical_services,
              size: 100,
              color: Colors.blue,
            ),
            
            // Espacement
            const SizedBox(height: 20),
            
            // Titre principal
            const Text(
              'Bienvenue sur Santé Market',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            // Espacement
            const SizedBox(height: 10),
            
            // Description
            const Text(
              'Votre marché pour les articles de santé',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            
            // Espacement
            const SizedBox(height: 30),
            
            // Premier bouton
            ElevatedButton(
              onPressed: () {
                // Action quand on clique sur le bouton
                print('Bouton Voir les produits cliqué !');
              },
              child: const Text('Voir les produits'),
            ),
            
            // Espacement
            const SizedBox(height: 10),
            
            // Deuxième bouton
            OutlinedButton(
              onPressed: () {
                // Action quand on clique sur le bouton
                print('Bouton Vendre un article cliqué !');
              },
              child: const Text('Vendre un article'),
            ),
          ],
        ),
      ),
    );
  }
}
// import : Importe les fonctionnalités Flutter nécessaires

// class HomeScreen : Définit notre écran comme une classe

// build() : Méthode qui construit l'interface

// Scaffold : Structure de base d'un écran Flutter

// AppBar : Barre en haut de l'écran

// Column : Dispose les éléments verticalement

// ElevatedButton : Bouton avec effet de relief