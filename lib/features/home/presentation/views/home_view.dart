import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/catrgories/data/data_sources/categories_local_data_source.dart';
import 'package:store_app_clean_arch/features/catrgories/data/repositories/categories_repository_impl.dart';
import 'package:store_app_clean_arch/features/catrgories/domain/repositories/categories_repository.dart';
import 'package:store_app_clean_arch/features/catrgories/domain/use_case/get_categoris_use_case.dart';
import 'package:store_app_clean_arch/features/catrgories/presentation/manager/cubit/categorey_cubit.dart';

import 'package:store_app_clean_arch/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoreyCubit(GetCategorisUseCase(CategoriesRepositoryImpl(CategoriesLocalDataSource())))..getCategory(),
     
    
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F1E9),
      
        body: HomeViewBody(),
      ),
    );
  }
}

