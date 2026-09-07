import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';

class AppTextStyles {
  static const String _font = 'Inter';

  // Large Heading Text with Dark Black Text
  static const TextStyle headingLarge = TextStyle(
    fontFamily: _font,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: _font,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle headingSmall = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.headerDarkBlackText,
  );

  // subheadings
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.subheadingDarkGreyText,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.subheadingDarkGreyText,
  );

  // small labels chip text etc
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.offGreyColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.offGreyColor,
  );

  // input fields text styles
  static const TextStyle inputLabel = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.subheadingDarkGreyText,
    letterSpacing: 0.5,
  );

  static const TextStyle hintText = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );

  static const TextStyle errorText = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );

    static const TextStyle strikethroughSmall = TextStyle(
      fontFamily: _font,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.offGreyColor,
      decoration: TextDecoration.lineThrough,
      decorationColor: AppColors.offGreyColor,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
    );

  static const TextStyle strikethroughMedium = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.offGreyColor,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.offGreyColor,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );
}
