import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/home/presentation/manager/bottom_nav_cubit.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/categoties_view.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/favorites_view.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/profile_view.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/widgets/custom_bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=> BottomNavCubit(),
     child:BlocBuilder<BottomNavCubit,int>(builder:(context,currentIndex){
      final List<Widget>pages =[ const HomeView(),
            const CategoriesView(),
            const FavoritesView(),
            const ProfileView(),];
            return Scaffold(
              body: IndexedStack(
                index: currentIndex,
                children: pages,
              ),
              bottomNavigationBar: CustomBottomBar(currentIndex: currentIndex, onTap: (index){
                context.read<BottomNavCubit>().changeTap(index);
              }),
            );
     }
     
     
     
      )
     
     
      ,);
  }
}