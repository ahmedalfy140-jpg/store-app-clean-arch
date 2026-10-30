import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E9),
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F1E9),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Favorites Page'),
      ),
    );
  }
}