import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nos Produits 🏥'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          // Carte produit 1
          _buildProductCard(
            name: 'Thermomètre Digital',
            price: '24,99 €',
            image: Icons.thermostat,
            description: 'Précis et fiable',
          ),
          // Carte produit 2
          _buildProductCard(
            name: 'Tensiomètre Électronique',
            price: '49,99 €',
            image: Icons.monitor_heart,
            description: 'Mesure précise de la pression',
          ),
          // Carte produit 3
          _buildProductCard(
            name: 'Masques de Protection',
            price: '9,99 €',
            image: Icons.masks,
            description: 'Lot de 50 masques',
          ),
        ],
      ),
    );
  }

  // Méthode pour construire une carte produit (Widget réutilisable)
  Widget _buildProductCard({
    required String name,
    required String price,
    required IconData image,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            // Icône du produit
            Icon(
              image,
              size: 50,
              color: Colors.green,
            ),
            const SizedBox(width: 15),
            // Informations du produit
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            // Bouton d'action
            IconButton(
              onPressed: () {
                print('Ajouter au panier: $name');
              },
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
// ListView : Crée une liste défilante

// Card : Carte avec effet d'élévation

// _buildProductCard : Méthode privée réutilisable (le _ signifie privé)