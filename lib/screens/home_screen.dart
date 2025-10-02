import 'package:flutter/material.dart';
import 'categories_screen.dart'; // Changement ici
import 'cart_screen.dart';
import '../data/categories_data.dart'; // Import ajouté

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Message de bienvenue
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
              'Votre marché professionnel pour les articles de santé',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            
            // Statistiques rapides
            _buildStatsCard(context),
            const SizedBox(height: 20),
            
            // Accès rapide aux catégories
            const Text(
              'Catégories principales',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildQuickCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(Icons.category, '${CategoriesData.categories.length}', 'Catégories'),
            _buildStatItem(Icons.medical_services, '20', 'Produits'),
            _buildStatItem(Icons.local_hospital, '5', 'Fournisseurs'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 30),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildQuickCategories(BuildContext context) {
    // Prendre les 3 premières catégories pour l'accueil
    final quickCategories = CategoriesData.categories.take(3).toList();
    
    return Column(
      children: quickCategories.map((category) {
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: Icon(category.icon, color: category.color),
            title: Text(category.name),
            subtitle: Text(category.description),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigation vers les catégories (l'utilisateur pourra ensuite choisir)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoriesScreen(),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}