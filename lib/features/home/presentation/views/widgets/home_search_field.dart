import 'package:flutter/material.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: 
      InputDecoration(
        hintText: 'Search for clothes, shoes, bags...',
        hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
        prefixIcon: Icon(Icons.search,color: Colors.black,),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none)
      ),

    
    );
  }
}