import 'package:store_app_clean_arch/features/products/data/data_sources/products_remote_data_source.dart';

import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';
import 'package:store_app_clean_arch/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl( this.remoteDataSource);
  @override
  Future<List<ProductEntity>> getproduct() async{
    return await remoteDataSource.getproduct();
    
  }
}