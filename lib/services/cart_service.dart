import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  // MÉTHODE MODIFIÉE : Ajout du paramètre categoryId
  void addItem(String productId, String name, double price, String image, String categoryId) {
    final existingIndex = _items.indexWhere((item) => item.id == productId);
    
    if (existingIndex >= 0) {
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(CartItem(
        id: productId,
        name: name,
        price: price,
        quantity: 1,
        image: image,
        categoryId: categoryId, // Ajouté
      ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

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

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // NOUVELLE MÉTHODE : Obtenir les articles groupés par catégorie
  Map<String, List<CartItem>> getItemsGroupedByCategory() {
    final Map<String, List<CartItem>> grouped = {};
    
    for (final item in _items) {
      if (!grouped.containsKey(item.categoryId)) {
        grouped[item.categoryId] = [];
      }
      grouped[item.categoryId]!.add(item);
    }
    
    return grouped;
  }
}