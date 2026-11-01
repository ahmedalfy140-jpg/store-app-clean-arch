import 'package:store_app_clean_arch/features/cart/domain/entities/cart_item_entity.dart';
import 'package:store_app_clean_arch/features/cart/domain/repositories/cart_repository.dart';
import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItemEntity> _items = [];

  @override
  List<CartItemEntity> getItems() {
    return List.unmodifiable(_items);
  }

  @override
  void addProduct(ProductEntity product) {
    final index = _items.indexWhere(
      (item) => item.id == product.id,
    );

    if (index != -1) {
      final currentItem = _items[index];

      _items[index] = currentItem.copyWith(
        quantity: currentItem.quantity + 1,
      );
    } else {
      _items.add(
        CartItemEntity(
          id: product.id,
          title: product.title,
          image: product.image,
          price: product.price,
        ),
      );
    }
  }

  @override
  void increaseQuantity(int productId) {
    final index = _items.indexWhere(
      (item) => item.id == productId,
    );

    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    }
  }

  @override
  void decreaseQuantity(int productId) {
    final index = _items.indexWhere(
      (item) => item.id == productId,
    );

    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index] = _items[index].copyWith(
          quantity: _items[index].quantity - 1,
        );
      } else {
        _items.removeAt(index);
      }
    }
  }

  @override
  void removeProduct(int productId) {
    _items.removeWhere(
      (item) => item.id == productId,
    );
  }

  @override
  void clearCart() {
    _items.clear();
  }
}