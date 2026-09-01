import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class IntroStepperScreen extends StatefulWidget {
  const IntroStepperScreen({super.key});

  @override
  State<IntroStepperScreen> createState() => _IntroStepperScreenState();
}

class _IntroStepperScreenState extends State<IntroStepperScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _stepperPages = [
    {
      'image': AppImages.introImageOne,
      'title': AppStrings.introScreenOneTitle,
      'subTitle': AppStrings.introScreenOneSubtitle,
    },
    {
      'image': AppImages.introImageTwo,
      'title': AppStrings.introScreenTwoTitle,
      'subTitle': AppStrings.introScreenTwoSubTitle,
    },
    {
      'image': AppImages.introImageThree,
      'title': AppStrings.introScreenThreeTitle,
      'subTitle': AppStrings.introScreenThreeSubtitle,
    },
  ];

  void _handleButtonPress() {
    if (_currentPage == _stepperPages.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = _currentPage == _stepperPages.length - 1;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 34),
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: .centerEnd,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.loginScreen,
                  );
                },
                child: Text(
                  AppStrings.skipText,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.offGreyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Scrollable Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _stepperPages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: .center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(_stepperPages[index]['image']!),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _stepperPages[index]['title']!,
                        style: AppTextStyles.display.copyWith(fontSize: 21),
                        textAlign: .center,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          _stepperPages[index]['subTitle']!,
                          style: AppTextStyles.bodySmall,
                          textAlign: .center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Column(
              spacing: 3,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _stepperPages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.primaryColor
                            : AppColors.greyDotColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleButtonPress,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.coloredText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Text(
                        isLastPage
                            ? AppStrings.getStartedText
                            : AppStrings.nextText,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
