import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_progress_indicator.dart';

class StockLevelProgressIndicator extends StatelessWidget {
  final String label;
  final int value;
  final Color? barColor;
  final int totalStock;

  const StockLevelProgressIndicator({
    super.key,
    required this.label,
    required this.value,
    this.barColor,
    required this.totalStock,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(label, style: value <= 200 ? AppTextStyles.labelSmall.copyWith(
              color: AppColors.errorLabel,
            ) : AppTextStyles.labelSmall.copyWith(
              color: AppColors.primary,
            ),),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$value',
                    style: value <= 200 ? AppTextStyles.labelMedium.copyWith(
                      color: AppColors.errorLabel,
                    ) : AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' / $totalStock',
                    style: AppTextStyles.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
          child: CommonProgressIndicator(
            value: value,
            totalItems: totalStock,
            barColor: value <= 200 ? AppColors.darkRed : barColor,
          ),
        ),
      ],
    );
  }
}
