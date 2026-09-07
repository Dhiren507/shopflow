import 'package:flutter/material.dart';
import 'package:shopflow/core/widgets/common_progress_indicator.dart';

import '../../../core/constants/app_colors.dart';

class RatingProgressRow extends StatelessWidget {
  final String leadingText;
  final num? value;
  final num? totalReviewCount;

  const RatingProgressRow({
    super.key,
    this.value,
    this.totalReviewCount,
    required this.leadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(leadingText),
        Icon(Icons.star, size: 13, color: AppColors.greyColor),
        SizedBox(
          height: 8,
          width: 125,
          child: CommonProgressIndicator(
            value: value,
            totalItems: totalReviewCount,
          ),
        ),
      ],
    );
  }
}
