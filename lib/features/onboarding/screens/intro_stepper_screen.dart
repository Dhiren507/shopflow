import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/features/onboarding/constants/onboarding_screen_constants.dart';

class IntroStepperScreen extends StatefulWidget {
  const IntroStepperScreen({super.key});

  @override
  State<IntroStepperScreen> createState() => _IntroStepperScreenState();
}

class _IntroStepperScreenState extends State<IntroStepperScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _handleButtonPress() {
    if (_currentPage == OnboardingScreenConstants.stepperPages.length - 1) {
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
    final bool isLastPage =
        _currentPage == OnboardingScreenConstants.stepperPages.length - 1;
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 32, horizontal: 16),
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
                  style: AppTextStyles.labelMedium,
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingScreenConstants.stepperPages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: .center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          OnboardingScreenConstants
                              .stepperPages[index]['image']!,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FittedBox(
                        fit: .scaleDown,
                        child: Text(
                          OnboardingScreenConstants
                              .stepperPages[index]['title']!,
                          style: AppTextStyles.headingLarge.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          OnboardingScreenConstants
                              .stepperPages[index]['subTitle']!,
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
                    OnboardingScreenConstants.stepperPages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.primary
                            : AppColors.divider,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                CommonButton(
                  label: isLastPage
                      ? AppStrings.getStartedText
                      : AppStrings.nextText,
                  onPressed: _handleButtonPress,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
