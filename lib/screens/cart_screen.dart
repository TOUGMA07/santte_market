import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import '../models/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = Provider.of<CartService>(context);
    final items = cartService.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Panier 🛒'),
        backgroundColor: Colors.orange[700],
        foregroundColor: Colors.white,
        actions: [
          if (items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _showClearCartDialog(context, cartService);
              },
            ),
        ],
      ),
      body: items.isEmpty
          ? _buildEmptyCart()
          : _buildCartWithItems(items, cartService),
      bottomNavigationBar: items.isEmpty ? null : _buildCheckoutSection(cartService),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_checkout,
            size: 100,
            color: Colors.orange,
          ),
          const SizedBox(height: 20),
          const Text(
            'Votre panier est vide',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Ajoutez des produits pour les voir ici',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCartWithItems(List<CartItem> items, CartService cartService) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildCartItem(item, cartService);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(CartItem item, CartService cartService) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[50],
          child: const Icon(Icons.medical_services, color: Colors.blue),
        ),
        title: Text(item.name),
        subtitle: Text('${item.price} € × ${item.quantity}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bouton moins
            IconButton(
              icon: const Icon(Icons.remove, size: 20),
              onPressed: () {
                cartService.updateQuantity(item.id, item.quantity - 1);
              },
            ),
            // Quantité
            Text('${item.quantity}'),
            // Bouton plus
            IconButton(
              icon: const Icon(Icons.add, size: 20),
              onPressed: () {
                cartService.updateQuantity(item.id, item.quantity + 1);
              },
            ),
            // Bouton supprimer
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
              onPressed: () {
                cartService.removeItem(item.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutSection(CartService cartService) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${cartService.totalPrice.toStringAsFixed(2)} €',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print('Procéder au paiement');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'PROCÉDER AU PAIEMENT',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog(BuildContext context, CartService cartService) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Vider le panier'),
        content: const Text('Êtes-vous sûr de vouloir vider tout le panier ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              cartService.clearCart();
              Navigator.pop(context);
            },
            child: const Text(
              'Vider',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}