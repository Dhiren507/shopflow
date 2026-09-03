import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';

class AppTextStyles {
  static const String _fontFamily = 'Inter';

  // heading large text styles
  static const TextStyle display = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle displayMediumSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.headerDarkBlackText,
  );


  static const TextStyle displaySmallSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle displaySmallBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle displayMediumBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.headerDarkBlackText,
  );

  static const TextStyle coloredDisplayText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static const TextStyle coloredDisplayTextMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static const TextStyle coloredDisplayTextSmallSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  // Subheading small text styles
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.subheadingDarkGreyText,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.subheadingDarkGreyText,
  );

  static const TextStyle coloredBodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );

  static const TextStyle errorText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );

  // Button Text Styles
  static const TextStyle buttonText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle buttonTextMediumWhite = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle buttonTextMediumBlack = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle mutedGreyText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.offGreyColor,
  );

  static const TextStyle mutedGreyTextSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.offGreyColor,
  );

  static const TextStyle mutedGreyTextSmallLineThrough = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.offGreyColor,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.offGreyColor,
    decorationStyle:
    TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );


  static const TextStyle mutedGreyTextMediumLineThrough = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.offGreyColor,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.offGreyColor,
    decorationStyle:
    TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );

  // input field text Styles
  static const TextStyle inputLabel = TextStyle(
    color: AppColors.subheadingDarkGreyText,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.5,
  );

  static const TextStyle hintText = TextStyle(
    color: AppColors.greyColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );


  static const TextStyle smallChipText = TextStyle(
    color: AppColors.lightGreyColor,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.12,
  );
}
