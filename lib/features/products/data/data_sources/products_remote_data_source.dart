

import 'package:dio/dio.dart';
import 'package:store_app_clean_arch/features/products/data/models/product_models.dart';

class ProductsRemoteDataSource {
final Dio dio ;

  ProductsRemoteDataSource( this.dio);
  Future< List<ProductModels>> getproduct() async{
    final response =await dio.get('https://fakestoreapi.com/products') ;

 final List<dynamic> data = response.data;  
 return data
        .map((product) => ProductModels.fromjson(product as Map<String,dynamic>))
        .toList(); 

  
  } 
}