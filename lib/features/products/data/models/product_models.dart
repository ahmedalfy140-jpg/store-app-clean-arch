import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';

class ProductModels extends ProductEntity {
  ProductModels({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rate,
    required super.count,
  });
  factory ProductModels.fromjson(Map<String,dynamic> json) {
    return ProductModels(
      id: json['id'],
      title: json['title'],
      price: (json['price']as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rate: (json['rating']['rate'] as num).toDouble() ,
      count: json['rating']['count'],
    );
  }
}
