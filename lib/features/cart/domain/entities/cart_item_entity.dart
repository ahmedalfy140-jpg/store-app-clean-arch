class CartItemEntity {
  final int id;
  final String title;
  final String image;
  final double price;
  final int quantity;

  const CartItemEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  CartItemEntity copyWith({
    int? quantity,
  }) {
    return CartItemEntity(
      id: id,
      title: title,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}