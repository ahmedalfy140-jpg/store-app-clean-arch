import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/catrgories/domain/use_case/get_categoris_use_case.dart';
import 'package:store_app_clean_arch/features/catrgories/presentation/manager/cubit/categorey_cubit.dart';
import 'package:store_app_clean_arch/features/catrgories/presentation/view/widget/category_view_body.dart';

import '../../data/data_sources/categories_local_data_source.dart';
import '../../data/repositories/categories_repository_impl.dart';


class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoreyCubit(
        GetCategorisUseCase(
          CategoriesRepositoryImpl(
            CategoriesLocalDataSource(),
          ),
        ),
      )..getCategory(),
      child: const CategoriesViewBody(),
    );
  }
}

