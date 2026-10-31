import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/catrgories/presentation/manager/cubit/categorey_cubit.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/widgets/home_categories_card.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shop by Category',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        BlocBuilder<CategoreyCubit, CategoreyState>(
          builder: (context, state) {
            
            if (state is CategoreyLoading) {
              return Center(
                child: CircularProgressIndicator(color: Color(0xFF9B7953)),
              );
            }
            if (state is CategoreyFailure) {
              return Center(child: Text(state.message));
            }
            if (state is CategoreySuccess) {
             
              return SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  itemBuilder: (context, index) {
                    final category = state.categories[index];

                    return HomeCategoriesCard(category: category, onTap: () {});
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
