import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';
import 'package:store_app_clean_arch/features/products/presentation/manager/cubit/favorite_cupit.dart';


class FavoritesView1 extends StatelessWidget {
  const FavoritesView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E9),
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: const Color(0xFFF5F1E9),
        elevation: 0,
      ),
      body: BlocBuilder<FavoritesCubit, List<ProductEntity>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No Favorites Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Add products you like to your favorites'),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 55,
                    height: 55,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      color: Color(0xFF9B7953),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      context
                          .read<FavoritesCubit>()
                          .toggleFavorite(product);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}