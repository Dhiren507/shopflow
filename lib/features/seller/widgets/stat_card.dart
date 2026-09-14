import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';

class StatCard extends StatelessWidget {
  final String leadingIconPath;
  final Color leadingIconBgColor;
  final String suffixIconPath;
  final Color suffixIconBgColor;

  final String mainTitle;
  final num value;
  final num progressValue;

  final bool isRatingCard;

  const StatCard({
    super.key,
    required this.leadingIconPath,
    required this.leadingIconBgColor,
    required this.suffixIconPath,
    required this.suffixIconBgColor,
    required this.mainTitle,
    required this.value,
    this.isRatingCard = false,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.bgStepper,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    leadingIconPath,
                    height: 20,
                    width: 20,
                    fit: BoxFit.scaleDown,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: suffixIconBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Row(
                      spacing: 3,
                      children: [
                        SvgPicture.asset(
                          suffixIconPath,
                          height: 12,
                          width: 7,
                          fit: BoxFit.scaleDown,
                        ),
                        Text(
                            progressValue > 0
                                ? (isRatingCard ? '+$progressValue' : '+$progressValue%')
                                : (isRatingCard ? '$progressValue' : '$progressValue%'),

                            style: progressValue > 0
                                ? AppTextStyles.bodySmall.copyWith(color: Colors
                                .green)
                                : progressValue < 0
                                ? AppTextStyles.bodySmall.copyWith(color: AppColors.saleBadge)
                                : AppTextStyles.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: .start,
              spacing: 5,
              children: [
                Text(mainTitle, style: AppTextStyles.bodyMedium),
                !isRatingCard
                    ? Text('$value', style: AppTextStyles.headingLarge)
                    : RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$value',
                        style: AppTextStyles.headingLarge,
                      ),
                      TextSpan(
                        text: ' / 5.0',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
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
