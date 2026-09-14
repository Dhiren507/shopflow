import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/numeric_stepper_button.dart';

import '../../../core/constants/app_colors.dart';

class CartItemCard extends StatelessWidget {
  final String productImagePath;
  final String productTitle;
  final String productColor;
  final num productPrice;
  final int productQuantity;
  final int productDiscount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onClose;

  const CartItemCard({
    super.key,
    required this.productTitle,
    required this.productColor,
    required this.productPrice,
    required this.productImagePath,
    this.productQuantity = 1,
    required this.onDecrement,
    required this.onIncrement,
    required this.onClose,
    required this.productDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: Image.network(productImagePath),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                  mainAxisSize: .min,
                spacing: 6,
                children: [
                  Text(
                    productTitle,
                    style: AppTextStyles.headingSmall,
                    overflow: .ellipsis,
                  ),

                  Text(

                    productColor,
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                  Wrap(
                    children: [
                      Text(
                        '\$$productPrice.00',
                        style: AppTextStyles.headingMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.errorText,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '-$productDiscount%',
                          style: AppTextStyles.whiteSmallLabel,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: .end,
              mainAxisAlignment: .spaceBetween,
              spacing: 10,
              children: [
                IconButton(
                  onPressed: () {
                    onClose();
                  },
                  icon: Icon(Icons.close),
                ),
                NumericStepperButton(
                  onDecrement: () {
                    onDecrement();
                  },
                  onIncrement: () {
                    onIncrement();
                  },
                  value: productQuantity,
                  isSmall: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
