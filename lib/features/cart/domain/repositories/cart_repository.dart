import 'package:store_app_clean_arch/features/cart/domain/entities/cart_item_entity.dart';
import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';

abstract class CartRepository {
  List<CartItemEntity> getItems();

  void addProduct(ProductEntity product);

  void increaseQuantity(int productId);

  void decreaseQuantity(int productId);

  void removeProduct(int productId);

  void clearCart();
}