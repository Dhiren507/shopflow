import 'package:flutter/material.dart';
import 'package:shopflow/core/widgets/common_base_screen.dart';
import 'package:shopflow/features/auth/screens/login_screen.dart';
import 'package:shopflow/features/onboarding/screens/intro_stepper_screen.dart';
import 'package:shopflow/features/onboarding/screens/splash_screen.dart';
import 'package:shopflow/features/profile/profile_screen.dart';
import 'package:shopflow/features/seller/screens/product_add_screen.dart';
import 'package:shopflow/features/seller/screens/seller_dashboard_screen.dart';
import 'package:shopflow/features/shop/screens/home_screen.dart';
import 'package:shopflow/features/seller/screens/my_products_listing_screen.dart';
import 'package:shopflow/features/shop/screens/product_detail_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String introScreen = '/introScreen';
  static const String loginScreen = '/loginScreen';
  static const String mainScreen = '/mainScreen';
  static const String homeScreen = '/homeScreen';
  static const String productDetailScreen = '/productDetailScreen';
  static const String myProductsListingScreen = '/myproducts';
  static const String addProductScreen = '/addproduct';
  static const String profileScreen = '/profile';
  static const String sellerDashboardScreen = '/sellerDashboard';

  static final Map<String, Widget Function(BuildContext context)> routes = {
    splashScreen: (context) => const SplashScreen(),
    introScreen: (context) => const IntroStepperScreen(),
    loginScreen: (context) => const LoginScreen(),
    homeScreen: (context) => const HomeScreen(),
    mainScreen: (context) => const CommonBaseScreen(),
    productDetailScreen: (context) => const ProductDetailScreen(),
    myProductsListingScreen : (context) => const MyProductsListingScreen(),
    addProductScreen : (context) => const  ProductAddScreen(),
    profileScreen : (context) => const ProfileScreen(),
    sellerDashboardScreen : (context) => SellerDashboardScreen()
  };
}
