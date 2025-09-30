import 'package:flutter/material.dart';
import 'products_screen.dart'; // Import de notre nouvel écran
import 'cart_screen.dart';     // Import de l'écran panier

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Santé Market 🏥'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.medical_services,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenue sur Santé Market',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Votre marché pour les articles de santé',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            
            // BOUTON MODIFIÉ - Maintenant il navigue vers ProductsScreen
            ElevatedButton(
              onPressed: () {
                // Navigation vers l'écran des produits
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductsScreen(),
                  ),
                );
              },
              child: const Text('Voir les produits'),
            ),
            
            const SizedBox(height: 10),
            
            // NOUVEAU BOUTON - Va vers le panier
            ElevatedButton(
              onPressed: () {
                // Navigation vers l'écran du panier
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text('Voir mon panier'),
            ),
          ],
        ),
      ),
    );
  }
}
// Navigator.push() : Ajoute un nouvel écran par-dessus l'actuel

// MaterialPageRoute : Crée une transition fluide entre les écrans

// builder : Construit l'écran de destination