class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String image;
  final String categoryId; // Nouveau champ

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.categoryId, // Ajouté
  });

  // Getter pour le prix total de cet article
  double get totalPrice => price * quantity;

  // Méthode pour créer une copie avec une quantité différente
  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
      image: image,
      categoryId: categoryId, // Ajouté
    );
  }
}