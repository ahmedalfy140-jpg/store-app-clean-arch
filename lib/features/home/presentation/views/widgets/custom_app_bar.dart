import 'package:flutter/material.dart';

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
      IconButton(onPressed: (){}, icon: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),)

    ],);
    
   
    
}}