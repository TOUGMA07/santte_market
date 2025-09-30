import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final IconData icon;
  final String description;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
    required this.description,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            // Icône du produit
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 40,
                color: Colors.green,
              ),
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
              onPressed: onAddToCart,
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.blue,
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}