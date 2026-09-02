import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';

class ProductRatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  const ProductRatingStars({
    super.key,
    required this.rating,
    this.size = 15.0,
    this.color = AppColors.coloredText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (rating >= index + 1) {
          return Icon(Icons.star, color: color, size: size);
        } else if (rating > index && rating < index + 1) {
          return Icon(Icons.star_half, color: color, size: size);
        } else {
          return Icon(
            Icons.star_border,
            color: AppColors.coloredText,
            size: size,
          );
        }
      }),
    );
  }
}
