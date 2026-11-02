import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';
import 'package:store_app_clean_arch/features/products/presentation/manager/cubit/favorite_cupit.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1E9),
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children:[ Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                    );
                  },
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                
                child:BlocBuilder<FavoritesCubit,List<ProductEntity>>(builder: (context,favorites){
                final isFavorite = favorites.any( 
                  (item)=>item.id==product.id,
            
                );
                return IconButton(onPressed: (){context.read<FavoritesCubit>().toggleFavorite(product);}, icon: Icon(isFavorite ? Icons.favorite :Icons.favorite_border,color: isFavorite ? Colors.red: Colors.grey,));
            
              }) )
              
              ]
                      ),
            const SizedBox(height: 25),

            Text(
              product.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9B7953),
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 5),
                Text('${product.rate} (${product.count} reviews)'),
              ],
            ),
            const SizedBox(height: 25),

            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().addProduct(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Product added to cart successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B7953),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
