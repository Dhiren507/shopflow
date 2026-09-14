import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Shop Flow',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: AppColors.primary),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
