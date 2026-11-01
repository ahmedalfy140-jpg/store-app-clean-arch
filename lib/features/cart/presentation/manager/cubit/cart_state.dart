import 'package:store_app_clean_arch/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItemEntity> items;

  CartUpdated(this.items);

  double get totalPrice {
    return items.fold(
      0,
      (total, item) => total + item.totalPrice,
    );
  }

  int get totalQuantity {
    return items.fold(
      0,
      (total, item) => total + item.quantity,
    );
  }
}