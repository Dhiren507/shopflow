import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';

class AppTextStyles {
  static const String _font = 'Inter';

  // Large Heading Text with Dark Black Text
  static const TextStyle headingLarge = TextStyle(
    fontFamily: _font,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: _font,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle headingMediumBoldColored = TextStyle(
    fontFamily: _font,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static const TextStyle headingSmall = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // subheadings
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // small labels chip text etc
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textHint,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textHint,
  );

  // input fields text styles
  static const TextStyle inputLabel = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.5,
  );

  static const TextStyle whiteSmallLabel = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static const TextStyle hintText = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.border,
  );

  static const TextStyle errorText = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.errorText,
  );

  static const TextStyle strikethroughSmall = TextStyle(
    fontFamily: _font,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textHint,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.textHint,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );

  static const TextStyle strikethroughMedium = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textHint,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.textHint,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );
}
