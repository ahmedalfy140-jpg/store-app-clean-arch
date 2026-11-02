import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';
import 'package:store_app_clean_arch/features/products/presentation/manager/cubit/favorite_cupit.dart';
import 'package:store_app_clean_arch/features/products/presentation/views/product_details_view.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cartCubit = context.read<CartCubit>();
        final favoritesCubit = context.read<FavoritesCubit>();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (routeContext) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: cartCubit),
                  BlocProvider.value(value: favoritesCubit),
                ],
                child: ProductDetailsView(product: product),
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      product.image,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.image_not_supported_outlined),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: BlocBuilder<FavoritesCubit, List<ProductEntity>>(
                      builder: (context, favorites) {
                        final isFavorite = favorites.any(
                          (item) => item.id == product.id,
                        );

                        return IconButton(
                          onPressed: () {
                            context.read<FavoritesCubit>().toggleFavorite(
                              product,
                            );
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9B7953),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rate} (${product.count})',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
