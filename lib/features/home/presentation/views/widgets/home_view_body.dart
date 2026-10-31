import 'package:flutter/material.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/widgets/home_categories_section.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/widgets/home_search_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
      
              Text(
                'Welcome to STYLE',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Discover your favorite fashion.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 25),
      
              HomeSearchField(),
              SizedBox(height: 30,),
              HomeCategoriesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
