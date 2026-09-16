import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/services/app_storage_service.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/features/onboarding/provider/onboarding_screen_provider.dart';

class IntroStepperScreen extends StatefulWidget {
  const IntroStepperScreen({super.key});

  @override
  State<IntroStepperScreen> createState() => _IntroStepperScreenState();
}

class _IntroStepperScreenState extends State<IntroStepperScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
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
              itemCount: AppStrings.stepperPages.length,
              onPageChanged: (index) {
                context.read<OnboardingScreenProvider>().setCurrentImageIndex(index);
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: .center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        AppStrings
                            .stepperPages[index]['image']!,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          FittedBox(
                            fit: .scaleDown,
                            child: Text(
                              AppStrings
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
                              AppStrings
                                  .stepperPages[index]['subTitle']!,
                              style: AppTextStyles.bodySmall,
                              textAlign: .center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),

            Consumer<OnboardingScreenProvider>(
              builder: (context, provider, child) {
                final bool isLastPage =
                    provider.currentImageIndex ==
                        AppStrings.stepperPages.length - 1;
                return Column(
                  spacing: 3,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        AppStrings.stepperPages.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          height: 8,
                          width:provider.currentImageIndex == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: provider.currentImageIndex == index
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
                      onPressed: () {
                        if (provider.currentImageIndex ==
                            AppStrings.stepperPages.length - 1) {
                          AppStorageService.setIsIntroCompleted(true);
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.loginScreen,
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
