import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_clean_arch/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:store_app_clean_arch/features/cart/presentation/views/cart_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Row(children: [
      Text(
        'STYLE',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 5,
          color: Colors.black,
        ),
      ),
      Spacer(),
      IconButton(onPressed: (){
          final cartCubit = context.read<CartCubit>();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (routeContext) {
        return BlocProvider.value(
          value: cartCubit,
          child: const CartView(),
        );
      },
    ),
  );
      }, icon: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),)

    ],);
    
   
    
}}