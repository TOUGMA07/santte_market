import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_card.dart';
import '../services/cart_service.dart';
import '../models/category.dart';
import '../models/cart_item.dart';

class ProductsScreen extends StatelessWidget {
  final ProductCategory? category;
  final List<CartItem> products;

  const ProductsScreen({
    super.key,
    this.category,
    required this.products,
  });

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
        title: category != null
            ? Text('${category!.name} 🏥')
            : const Text('Tous les Produits 🏥'),
        backgroundColor: category?.color ?? Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: products.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onAddToCart: () {
                    cartService.addItem(
                      product.id,
                      product.name,
                      product.price,
                      product.image,
                      product.categoryId,
                    );
                    _showAddedToCartMessage(context, product.name);
                  },
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2,
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 20),
          const Text(
            'Aucun produit disponible',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            category != null
                ? 'Aucun produit dans cette catégorie pour le moment'
                : 'Aucun produit disponible pour le moment',
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
}
