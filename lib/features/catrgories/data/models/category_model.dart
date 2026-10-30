import 'package:store_app_clean_arch/features/catrgories/domain/entities/category_entitey.dart';

class CategoryModel extends CategoryEntitey {
  CategoryModel({
    required super.id,
    required super.icon,
    required super.name,
    required super.description,
  });
   factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}