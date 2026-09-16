import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/providers/tab_bar_index_provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/common_button.dart';

class EmptyCartPlaceholder extends StatelessWidget {
  const EmptyCartPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.20),
                      blurRadius: 70,
                      spreadRadius: 5
                  ),
                ],
              ),
              child: SvgPicture.asset(
                AppImages.emptyCartImage,
                height: 250,
                width: 250,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(height: 35),
            Text(
              AppStrings.emptyCartMainText,
              style: AppTextStyles.headingLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppStrings.emptyCartSubText,
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            CommonButton(
              label: AppStrings.startShoppingText,
              onPressed: () {
                context.read<TabBarIndexProvider>().setCurrentTabIndex(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
