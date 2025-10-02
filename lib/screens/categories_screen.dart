import 'package:flutter/material.dart';
import '../data/categories_data.dart';
import '../data/products_data.dart';
import '../widgets/category_card.dart';
import 'products_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catégories de Produits 🏷️'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: CategoriesData.categories.length,
        itemBuilder: (context, index) {
          final category = CategoriesData.categories[index];
          final productsInCategory = ProductsData.getProductsByCategory(category.id);
          
          return CategoryCard(
            category: category,
            productCount: productsInCategory.length,
            onTap: () {
              // Navigation vers l'écran des produits de cette catégorie
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(
                    category: category,
                    products: productsInCategory,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
 