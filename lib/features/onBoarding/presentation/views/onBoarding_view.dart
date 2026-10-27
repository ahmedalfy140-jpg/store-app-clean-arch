import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:store_app_clean_arch/features/auth/presentation/views/login_view.dart';
import 'package:store_app_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:store_app_clean_arch/features/onBoarding/presentation/views/widgets/onboarding_2_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  int currentPage=0;
  void onPageChange(int index){
    setState(() {
      currentPage=index;
    });
  }
  final introKey =GlobalKey<IntroductionScreenState>();

  void _onIntroEnd ( BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const LoginView()));
  }
    Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
       showDoneButton: false,
      showBackButton: false,
      showNextButton: false,
      onChange: onPageChange ,
      key:introKey ,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: TextButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const OnboardingScreen()));
            }, child: Text('Skip'))

          ),
        ),
      ),
       globalFooter: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: currentPage >0  ?() => introKey.currentState?.previous() : null  ,
          child: const Text('Back'),
        ),

        TextButton(
          onPressed: () {
            if(currentPage==2){
              _onIntroEnd(context);
            }else{ introKey.currentState?.next();}
           
          },
          child:  Text(currentPage==2 ? 'Get Started ': 'Next'),
        ),
      ],
    ),
  ),
       
      pages: [
        PageViewModel(
          title: "Trendy Fashion",
          body: "Discover the latest styles in clothing, shoes, bags and more.",
          image: _buildImage('img4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Shop Your Favorite Styles",
          body: "Find what you love with a simple and easy shopping experience.",
          image: _buildImage('img5.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Look Good, Feel Great",
          body: "Stylish clothes, beautiful bags and more — all in one place.",
          image: _buildImage('img6.png'),
          decoration: pageDecoration,
        ),
        
      ],

     

     
    );
    
  }
}