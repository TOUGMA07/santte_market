import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  // Liste des articles dans le panier
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Nombre total d'articles
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  // Prix total du panier
  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.totalPrice);

  // Ajouter un article au panier
  void addItem(String productId, String name, double price, String image) {
    final existingIndex = _items.indexWhere((item) => item.id == productId);
    
    if (existingIndex >= 0) {
      // Article déjà présent, on augmente la quantité
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      // Nouvel article
      _items.add(CartItem(
        id: productId,
        name: name,
        price: price,
        quantity: 1,
        image: image,
      ));
    }
    notifyListeners();
  }

  // Supprimer un article du panier
  void removeItem(String productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  // Modifier la quantité d'un article
  void updateQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(productId);
      return;
    }

    final existingIndex = _items.indexWhere((item) => item.id == productId);
    if (existingIndex >= 0) {
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: newQuantity,
      );
      notifyListeners();
    }
  }

  // Vider tout le panier
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
