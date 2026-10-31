import 'package:flutter/material.dart';

import 'package:store_app_clean_arch/features/catrgories/domain/entities/category_entitey.dart';

class HomeCategoriesCard extends StatelessWidget {
  const HomeCategoriesCard({super.key, required this.category, this.onTap});
  final CategoryEntitey category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: onTap,
      child: SizedBox(
        width: 85,
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                category.image,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
                errorBuilder: (context,error,stackTrace){
                  return SizedBox(width: 75,
                  height: 75,
                  child: Icon(Icons.image_not_supported),);
                },
              ),
            ),
            SizedBox(height: 8),
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
