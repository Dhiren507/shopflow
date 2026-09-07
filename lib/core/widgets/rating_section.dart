import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/product_rating_stars.dart';
import 'package:shopflow/core/widgets/rating_progress_row.dart';

class RatingSection extends StatelessWidget {
  final int totalReviews;
  final double totalRating;

  const RatingSection({
    super.key,
    required this.totalRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 2,
              children: [
                Text('4.8', style: AppTextStyles.headingLarge),
                ProductRatingStars(rating: totalRating),
                Text('$totalReviews Reviews', style: AppTextStyles.labelSmall),
              ],
            ),
          ),
        ),

        Column(
          children: [
            RatingProgressRow(
              leadingText: '5',
              totalReviewCount: totalReviews,
              value: 500,
            ),
            RatingProgressRow(
              leadingText: '4',
              totalReviewCount: totalReviews,
              value: 200,
            ),
            RatingProgressRow(
              leadingText: '3',
              totalReviewCount: totalReviews,
              value: 100,
            ),
            RatingProgressRow(
              leadingText: '2',
              totalReviewCount: totalReviews,
              value: 100,
            ),
            RatingProgressRow(
              leadingText: '1',
              totalReviewCount: totalReviews,
              value: 150,
            ),
          ],
        ),
      ],
    );
  }
}
