import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const _blue = Color(0xFF1A2BFF);

  static const _sans = TextStyle(
    color: Colors.white,
    fontSize: 52,
    height: 1.1,
    fontWeight: FontWeight.w500,
    letterSpacing: -1,
  );

  static const _serif = TextStyle(
    color: Colors.white,
    fontSize: 56,
    height: 1.1,
    fontStyle: FontStyle.italic,
    fontFamily: 'serif',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/img7.jpg', fit: BoxFit.cover),
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Improve', style: _sans),
                Text('Fashion', style: _serif),
                Text('Quality', style: _sans),
              ],
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 32,
            child: SafeArea(
              child: Material(
                color: _blue,
                borderRadius: BorderRadius.circular(40),
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    // Navigator.pushReplacement(... LoginScreen())
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_bag_outlined,
                            color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text("Let's Shopping",
                            style: TextStyle(color: Colors.white, fontSize: 15)),
                        Spacer(),
                        Icon(Icons.arrow_forward,
                            color: Colors.white, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}