import 'package:flutter/material.dart';
import 'package:porto/screens/main_screen.dart';
import 'package:porto/utilities/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: MainPage(),
        duration: 3300,
        // imageSize: 130,
        // imageSrc: "assets/I.png",
        text: "Hello, Welcome to My Portofolio",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'SFMono',
          color: AppColors.hoverTextColor,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
