import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_progress < 1.0) {
          _progress += 0.2;
        }
      });

      if (timer.tick == 5) {
        Navigator.pushReplacementNamed(context, AppRoutes.introScreen);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(AppImages.appIconLogo),
            Text(
              AppStrings.appName,
              style: AppTextStyles.headingLarge.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              AppStrings.splashLoadingText,
              style: AppTextStyles.bodySmall,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(
                value: _progress,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
