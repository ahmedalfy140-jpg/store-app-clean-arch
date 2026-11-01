import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getproduct();
}