import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? elevation;
  final BorderSide? borderSide;

  const CommonButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.borderRadius = 12,
    this.backgroundColor = AppColors.primaryLight,
    this.textColor = AppColors.textOnDark,
    this.leadingIcon,
    this.trailingIcon,
    this.elevation,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation ?? 0,
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null) ...[
                leadingIcon!,
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: AppTextStyles.headingSmall.copyWith(color: textColor),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 6),
                trailingIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
