import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app_clean_arch/features/onBoarding/presentaion/views/onBoarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Introduction Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),

      home: OnboardingView(),
    );
  }
}
