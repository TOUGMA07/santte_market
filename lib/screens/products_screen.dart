import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import ajouté
import '../widgets/product_card.dart';
import '../services/cart_service.dart'; // Import ajouté

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = Provider.of<CartService>(context);

    void _showAddedToCartMessage(BuildContext context, String productName) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$productName ajouté au panier !'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nos Produits 🏥'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ProductCard(
            name: 'Thermomètre Digital',
            price: '24,99 €',
            icon: Icons.thermostat,
            description: 'Précis et fiable - Mesure en 10 secondes',
            onAddToCart: () {
              cartService.addItem('1', 'Thermomètre Digital', 24.99, 'thermometer');
              _showAddedToCartMessage(context, 'Thermomètre Digital');
            },
          ),
          ProductCard(
            name: 'Tensiomètre Électronique',
            price: '49,99 €',
            icon: Icons.monitor_heart,
            description: 'Mesure précise de la pression artérielle',
            onAddToCart: () {
              cartService.addItem('2', 'Tensiomètre Électronique', 49.99, 'tensiometer');
              _showAddedToCartMessage(context, 'Tensiomètre Électronique');
            },
          ),
          ProductCard(
            name: 'Masques de Protection',
            price: '9,99 €',
            icon: Icons.masks,
            description: 'Lot de 50 masques chirurgicaux',
            onAddToCart: () {
              cartService.addItem('3', 'Masques de Protection', 9.99, 'masks');
              _showAddedToCartMessage(context, 'Masques de Protection');
            },
          ),
          ProductCard(
            name: 'Gel Hydroalcoolique',
            price: '4,99 €',
            icon: Icons.clean_hands,
            description: 'Flacon 500ml - 70% alcool',
            onAddToCart: () {
              cartService.addItem('4', 'Gel Hydroalcoolique', 4.99, 'gel');
              _showAddedToCartMessage(context, 'Gel Hydroalcoolique');
            },
          ),
        ],
      ),
    );
  }
}