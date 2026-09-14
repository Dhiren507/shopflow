import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/product_rating_stars.dart';
import 'package:shopflow/features/shop/widgets/rating_progress_row.dart';

class RatingSection extends StatelessWidget {
  final int totalReviews;
  final num totalRating;
  final int fiveStarReviewCount;
  final int fourStarReviewCount;
  final int threeStarReviewCount;
  final int twoStarReviewCount;
  final int oneStarReviewCount;

  const RatingSection({
    super.key,
    required this.totalRating,
    required this.totalReviews,
    required this.fiveStarReviewCount,
    required this.fourStarReviewCount,
    required this.threeStarReviewCount,
    required this.twoStarReviewCount,
    required this.oneStarReviewCount,
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
                Text('$totalRating', style: AppTextStyles.headingLarge),
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
              value: fiveStarReviewCount,
            ),
            RatingProgressRow(
              leadingText: '4',
              totalReviewCount: totalReviews,
              value: fourStarReviewCount,
            ),
            RatingProgressRow(
              leadingText: '3',
              totalReviewCount: totalReviews,
              value: threeStarReviewCount,
            ),
            RatingProgressRow(
              leadingText: '2',
              totalReviewCount: totalReviews,
              value: twoStarReviewCount,
            ),
            RatingProgressRow(
              leadingText: '1',
              totalReviewCount: totalReviews,
              value: oneStarReviewCount,
            ),
          ],
        ),
      ],
    );
  }
}
