import '../models/cart_item.dart';

class ProductsData {
  static final List<CartItem> allProducts = [
    // Catégorie 1: Médicaments & Produits pharmaceutiques
    CartItem(
      id: '1',
      name: 'Paracétamol 500mg',
      price: 3.50,
      quantity: 1,
      image: 'paracetamol',
      categoryId: '1',
    ),
    CartItem(
      id: '2',
      name: 'Ibuprofène 400mg',
      price: 4.20,
      quantity: 1,
      image: 'ibuprofene',
      categoryId: '1',
    ),
    CartItem(
      id: '3',
      name: 'Vitamine C 1000mg',
      price: 8.90,
      quantity: 1,
      image: 'vitamine_c',
      categoryId: '1',
    ),
    CartItem(
      id: '4',
      name: 'Sirop contre la toux',
      price: 6.75,
      quantity: 1,
      image: 'sirop_toux',
      categoryId: '1',
    ),

    // Catégorie 2: Dispositifs Médicaux (DM)
    CartItem(
      id: '5',
      name: 'Tensiomètre Électronique',
      price: 49.99,
      quantity: 1,
      image: 'tensiometre',
      categoryId: '2',
    ),
    CartItem(
      id: '6',
      name: 'Thermomètre Digital',
      price: 24.99,
      quantity: 1,
      image: 'thermometre',
      categoryId: '2',
    ),
    CartItem(
      id: '7',
      name: 'Stéthoscope Professionnel',
      price: 35.50,
      quantity: 1,
      image: 'stethoscope',
      categoryId: '2',
    ),
    CartItem(
      id: '8',
      name: 'Nébuliseur',
      price: 89.99,
      quantity: 1,
      image: 'nebuliseur',
      categoryId: '2',
    ),

    // Catégorie 3: Consommables médicaux
    CartItem(
      id: '9',
      name: 'Compresses Stériles',
      price: 12.50,
      quantity: 1,
      image: 'compresses',
      categoryId: '3',
    ),
    CartItem(
      id: '10',
      name: 'Seringues 10ml',
      price: 8.90,
      quantity: 1,
      image: 'seringues',
      categoryId: '3',
    ),
    CartItem(
      id: '11',
      name: 'Gants Latex (100 pièces)',
      price: 15.75,
      quantity: 1,
      image: 'gants_latex',
      categoryId: '3',
    ),
    CartItem(
      id: '12',
      name: 'Pansements Adhésifs',
      price: 5.25,
      quantity: 1,
      image: 'pansements',
      categoryId: '3',
    ),

    // Catégorie 4: Produits d'hygiène & Désinfection
    CartItem(
      id: '13',
      name: 'Gel Hydroalcoolique 1L',
      price: 7.90,
      quantity: 1,
      image: 'gel_hydro',
      categoryId: '4',
    ),
    CartItem(
      id: '14',
      name: 'Masques Chirurgicaux (50)',
      price: 9.99,
      quantity: 1,
      image: 'masques',
      categoryId: '4',
    ),
    CartItem(
      id: '15',
      name: 'Solution Désinfectante',
      price: 12.25,
      quantity: 1,
      image: 'desinfectant',
      categoryId: '4',
    ),
    CartItem(
      id: '16',
      name: 'Savon Antibactérien',
      price: 4.50,
      quantity: 1,
      image: 'savon',
      categoryId: '4',
    ),

    // Catégorie 5: Mobilier médical & Logistique
    CartItem(
      id: '17',
      name: 'Fauteuil de Consultation',
      price: 299.99,
      quantity: 1,
      image: 'fauteuil',
      categoryId: '5',
    ),
    CartItem(
      id: '18',
      name: 'Table d\'Examen',
      price: 450.00,
      quantity: 1,
      image: 'table_examen',
      categoryId: '5',
    ),
    CartItem(
      id: '19',
      name: 'Armoire à Pharmacie',
      price: 189.99,
      quantity: 1,
      image: 'armoire_pharmacie',
      categoryId: '5',
    ),
    CartItem(
      id: '20',
      name: 'Civière Médicale',
      price: 320.50,
      quantity: 1,
      image: 'civiere',
      categoryId: '5',
    ),
  ];

  // Méthode pour obtenir les produits d'une catégorie spécifique
  static List<CartItem> getProductsByCategory(String categoryId) {
    return allProducts.where((product) => product.categoryId == categoryId).toList();
  }

  // Méthode pour obtenir un produit par son ID
  static CartItem getProductById(String id) {
    return allProducts.firstWhere((product) => product.id == id);
  }
}

