
import 'package:store_app_clean_arch/features/catrgories/data/models/category_model.dart';

class CategoriesLocalDataSource {
  Future<List<CategoryModel>> getCategory() async {
    final List<Map<String, dynamic>> categories = [
      {
        'id': '1',
        'name': 'Men',
        'description': 'Clothing & outfits',
        'image': 'assets/men.png',
      },
      {
        'id': '2',
        'name': 'Women',
        'description': 'Fashion & outfits',
        'image': 'assets/wamen.jpg',
      },
      {
        'id': '3',
        'name': 'Shoes',
        'description': 'All shoe styles',
        'image': 'assets/shoose.jpg',
      },
      {
        'id': '4',
        'name': 'Bags',
        'description': 'Everyday essentials',
        'image': 'assets/bag.jpg',
      },
    ];

    return categories
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
