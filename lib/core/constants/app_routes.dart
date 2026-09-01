import 'package:flutter/material.dart';
import 'package:shopflow/features/auth/screens/login_screen.dart';
import 'package:shopflow/features/onboarding/screens/intro_stepper_screen.dart';
import 'package:shopflow/features/onboarding/screens/splash_screen.dart';
import 'package:shopflow/features/shop/screens/home_screen.dart';
import 'package:shopflow/features/shop/screens/product_detail_screen.dart';

class AppRoutes {
  static final String splashScreen = '/';
  static final String introScreen = '/introScreen';
  static final String loginScreen = '/loginScreen';
  static final String homeScreen = '/homeScreen';
  static final String productDetailScreen = '/productDetailScreen';

  static final Map<String, Widget Function(BuildContext context)> routes = {
    splashScreen: (context) => const SplashScreen(),
    introScreen: (context) => const IntroStepperScreen(),
    loginScreen: (context) => const LoginScreen(),
    homeScreen: (context) => const HomeScreen(),
    productDetailScreen: (context) => const ProductDetailScreen(),
  };
}
