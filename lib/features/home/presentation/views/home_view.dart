import 'package:flutter/material.dart';
import 'package:store_app_clean_arch/features/onBoarding/presentation/views/onBoarding_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
    void _onBackToIntro(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnboardingView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:Text('Home'),centerTitle: true,),
      body:Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),],)) ,
    );
  }
}