import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_strings.dart';

class OnboardingScreenConstants {
  static const List<Map<String, String>> stepperPages = [
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
}