import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesData {
  static final List<ProductCategory> categories = [
    ProductCategory(
      id: '1',
      name: 'Médicaments & Produits pharmaceutiques',
      description: 'Médicaments sur ordonnance et en vente libre',
      icon: Icons.medication,
      color: Colors.red,
    ),
    ProductCategory(
      id: '2',
      name: 'Dispositifs Médicaux (DM)',
      description: 'Équipements et instruments médicaux',
      icon: Icons.monitor_heart,
      color: Colors.blue,
    ),
    ProductCategory(
      id: '3',
      name: 'Consommables médicaux',
      description: 'Fournitures à usage unique et consommables',
      icon: Icons.medical_services,
      color: Colors.green,
    ),
    ProductCategory(
      id: '4',
      name: 'Produits d\'hygiène & Désinfection',
      description: 'Hygiène, nettoyage et désinfection',
      icon: Icons.clean_hands,
      color: Colors.orange,
    ),
    ProductCategory(
      id: '5',
      name: 'Mobilier médical & Logistique',
      description: 'Mobilier et équipements pour établissements de santé',
      icon: Icons.weekend,
      color: Colors.purple,
    ),
  ];

  // Méthode pour trouver une catégorie par son ID
  static ProductCategory getCategoryById(String id) {
    return categories.firstWhere((category) => category.id == id);
  }
} 