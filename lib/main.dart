import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/features/onboarding/provider/onboarding_screen_provider.dart';
import 'package:shopflow/features/seller/provider/add_product_provider.dart';
import 'package:shopflow/features/auth/provider/auth_provider.dart';
import 'package:shopflow/core/providers/cart_provider.dart';
import 'package:shopflow/core/providers/category_provider.dart';
import 'package:shopflow/features/shop/providers/home_screen_provider.dart';
import 'package:shopflow/features/shop/providers/product_detail_provider.dart';
import 'package:shopflow/core/providers/tab_bar_index_provider.dart';
import 'package:shopflow/core/services/app_storage_service.dart';
import 'package:shopflow/features/seller/provider/my_products_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => AddProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => TabBarIndexProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingScreenProvider()),
        ChangeNotifierProvider(create: (_) => MyProductsScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Shop Flow',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: AppColors.primary),
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}
