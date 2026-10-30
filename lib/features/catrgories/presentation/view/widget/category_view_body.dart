import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/catrgories/presentation/manager/cubit/categorey_cubit.dart';
import 'package:store_app_clean_arch/features/catrgories/presentation/view/widget/category_card.dart';


class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F1E9),
        elevation: 0,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find what you are looking for',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CategoreyCubit, CategoreyState>(
                builder: (context, state) {
                  if (state is CategoreyLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF9B7953),
                      ),
                    );
                  }

                  if (state is CategoreyFailure) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  if (state is CategoreySuccess) {
                    return GridView.builder(
                      itemCount: state.categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) {
                        final category = state.categories[index];

                        return CategoryCard(
                          category: category,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${category.name} selected',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}