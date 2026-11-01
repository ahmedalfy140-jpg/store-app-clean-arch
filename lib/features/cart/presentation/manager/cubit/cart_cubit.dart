import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/cart/domain/repositories/cart_repository.dart';
import 'package:store_app_clean_arch/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;

  CartCubit(this.repository) : super(CartInitial()) {
    _emitCart();
  }

  void _emitCart() {
    emit(CartUpdated(repository.getItems()));
  }

  void addProduct(ProductEntity product) {
    repository.addProduct(product);
    _emitCart();
  }

  void increaseQuantity(int productId) {
    repository.increaseQuantity(productId);
    _emitCart();
  }

  void decreaseQuantity(int productId) {
    repository.decreaseQuantity(productId);
    _emitCart();
  }

  void removeProduct(int productId) {
    repository.removeProduct(productId);
    _emitCart();
  }

  void clearCart() {
    repository.clearCart();
    _emitCart();
  }
}