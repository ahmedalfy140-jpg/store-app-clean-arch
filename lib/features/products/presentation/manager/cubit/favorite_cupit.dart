import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';

class FavoritesCubit extends Cubit<List<ProductEntity>> {
  FavoritesCubit() : super([]);

  void toggleFavorite(ProductEntity product) {
    final favorites = List<ProductEntity>.from(state);

    final index = favorites.indexWhere(
      (item) => item.id == product.id,
    );

    if (index != -1) {
      favorites.removeAt(index);
    } else {
      favorites.add(product);
    }

    emit(favorites);
  }

  bool isFavorite(int productId) {
    return state.any((item) => item.id == productId);
  }

  void clearFavorites() {
    emit([]);
  }
}