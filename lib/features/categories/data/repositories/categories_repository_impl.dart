import 'package:store_app_clean_arch/features/categories/data/data_sources/categories_local_data_source.dart';
import 'package:store_app_clean_arch/features/categories/domain/entities/category_entitey.dart';
import 'package:store_app_clean_arch/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesLocalDataSource localDataSource;

  CategoriesRepositoryImpl( this.localDataSource);
  @override
  Future<List<CategoryEntitey>> getCategory() async{
    return await localDataSource.getCategory();
    
  }
}