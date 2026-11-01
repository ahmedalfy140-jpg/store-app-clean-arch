import 'package:store_app_clean_arch/features/categories/domain/entities/category_entitey.dart';
import 'package:store_app_clean_arch/features/categories/domain/repositories/categories_repository.dart';

class GetCategorisUseCase {
  final CategoriesRepository repository;

  GetCategorisUseCase( this.repository);
  Future <List<CategoryEntitey>> call(){
    return repository.getCategory();
  }
}