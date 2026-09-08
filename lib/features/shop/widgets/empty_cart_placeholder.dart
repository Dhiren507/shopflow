import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/common_button.dart';

class EmptyCartPlaceholder extends StatelessWidget {
  const EmptyCartPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 25,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 60,
                      spreadRadius: 10
                  ),
                ],
              ),
              child: SvgPicture.asset(AppImages.emptyCartImage, height: 250, width: 250, fit: BoxFit.scaleDown,),
            ),
            Text(
              AppStrings.emptyCartMainText,
              style: AppTextStyles.headingLarge,
            ),
            Text(
              AppStrings.emptyCartSubText,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
            CommonButton(
              label: AppStrings.startShoppingText,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
