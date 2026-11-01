import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';
import 'package:store_app_clean_arch/features/products/domain/repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase( this.repository);
  Future<List<ProductEntity>> call() async {
    return await repository.getproduct();

  }
}