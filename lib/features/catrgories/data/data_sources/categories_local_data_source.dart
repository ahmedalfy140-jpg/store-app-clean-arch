import 'package:store_app_clean_arch/features/catrgories/data/models/category_model.dart';

class CategoriesLocalDataSource {
    Future<List<CategoryModel>> getCategory() async{
       final List<Map<String, dynamic>> categories = [
      {
        'id': '1',
        'name': 'Men',
        'description': 'Clothing & outfits',
        'icon': 'men',
      },
      {
        'id': '2',
        'name': 'Women',
        'description': 'Fashion & outfits',
        'icon': 'women',
      },
      {
        'id': '3',
        'name': 'Shoes',
        'description': 'All shoe styles',
        'icon': 'shoes',
      },
      {
        'id': '4',
        'name': 'Bags',
        'description': 'Everyday essentials',
        'icon': 'bags',
      },
    ];
    return categories.map((category) => CategoryModel.fromJson(category)).toList();


    }
}