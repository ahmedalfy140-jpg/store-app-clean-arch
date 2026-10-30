import 'package:store_app_clean_arch/features/catrgories/domain/entities/category_entitey.dart';

abstract class CategoriesRepository {
  Future <List<CategoryEntitey>> getCategory();
}