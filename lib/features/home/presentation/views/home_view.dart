import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app_clean_arch/features/categories/domain/use_case/get_categoris_use_case.dart';
import 'package:store_app_clean_arch/features/categories/presentation/manager/cubit/categorey_cubit.dart';
import 'package:store_app_clean_arch/features/categories/data/data_sources/categories_local_data_source.dart';
import 'package:store_app_clean_arch/features/categories/data/repositories/categories_repository_impl.dart';

import 'package:store_app_clean_arch/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:store_app_clean_arch/features/products/data/repositories/products_repository_impl.dart';
import 'package:store_app_clean_arch/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:store_app_clean_arch/features/products/presentation/manager/cubit/favorite_cupit.dart';
import 'package:store_app_clean_arch/features/products/presentation/manager/cubit/products_cubit.dart';

import 'package:store_app_clean_arch/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoreyCubit(
            GetCategorisUseCase(
              CategoriesRepositoryImpl(
                CategoriesLocalDataSource(),
              ),
            ),
          )..getCategory(),
        ),

        BlocProvider(
          create: (context) => ProductCubit(
           GetProductsUseCase(ProductsRepositoryImpl(ProductsRemoteDataSource(Dio()) ))
          )..getproduct(),
        ),
       
       
      ],
      child: const Scaffold(
        backgroundColor: Color(0xFFF5F1E9),
        body: HomeViewBody(),
      ),
    );
  }
}