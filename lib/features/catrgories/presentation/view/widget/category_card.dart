import 'package:flutter/material.dart';
import 'package:store_app_clean_arch/features/catrgories/domain/entities/category_entitey.dart';


class CategoryCard extends StatelessWidget {
  final CategoryEntitey category;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  IconData get categoryIcon {
    switch (category.icon) {
      case 'men':
        return Icons.man;
      case 'women':
        return Icons.woman;
      case 'shoes':
        return Icons.directions_run;
      case 'bags':
        return Icons.shopping_bag_outlined;
      default:
        return Icons.category_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F1E9),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  categoryIcon,
                  size: 65,
                  color: const Color(0xFF9B7953),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
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