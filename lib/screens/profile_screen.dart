import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil 👤'),
        backgroundColor: Colors.purple[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Photo de profil
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            
            // Nom d'utilisateur
            const Text(
              'Jean Dupont',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            
            // Email
            Text(
              'jean.dupont@email.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            
            // Options du profil
            _buildProfileOption(
              icon: Icons.edit,
              title: 'Modifier le profil',
              onTap: () {
                print('Modifier le profil');
              },
            ),
            _buildProfileOption(
              icon: Icons.history,
              title: 'Historique des commandes',
              onTap: () {
                print('Historique des commandes');
              },
            ),
            _buildProfileOption(
              icon: Icons.favorite,
              title: 'Produits favoris',
              onTap: () {
                print('Produits favoris');
              },
            ),
            _buildProfileOption(
              icon: Icons.settings,
              title: 'Paramètres',
              onTap: () {
                print('Paramètres');
              },
            ),
            _buildProfileOption(
              icon: Icons.logout,
              title: 'Déconnexion',
              onTap: () {
                print('Déconnexion');
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(color: color),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
