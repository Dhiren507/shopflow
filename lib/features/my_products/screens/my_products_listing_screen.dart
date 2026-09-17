import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/features/my_products/providers/my_products_screen_provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class MyProductsListingScreen extends StatefulWidget {
  const MyProductsListingScreen({super.key});

  @override
  State<MyProductsListingScreen> createState() =>
      _MyProductsListingScreenState();
}

class _MyProductsListingScreenState extends State<MyProductsListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('My Products', style: AppTextStyles.headingLarge),
            Row(
              spacing: 5,
              children: [
                Text('${AppStrings.myProductsList.length} items', style: AppTextStyles.bodySmall),
                Container(
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    shape: BoxShape.circle,
                  ),
                ),
                Text('340 in stock', style: AppTextStyles.bodySmall),
              ],
            ),

            const SizedBox(height: 24),

            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.bgTile,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Consumer<MyProductsScreenProvider>(builder: (context, provider, child) {
                return Row(
                  children: List.generate(AppStrings.tabs.length, (index) {
                    final isSelected = provider.currentTabIndex == index;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          provider.setCurrentTabIndex(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            AppStrings.tabs[index],
                            style: AppTextStyles.headingSmall.copyWith(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },)
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final item = AppStrings.myProductsList[index];
                  return Card(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // image container
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(8),
                              child: Image.network(
                                'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              mainAxisSize: .min,
                              spacing: 10,
                              children: [
                                Flexible(
                                  child: Text(
                                    item['name'],
                                    style: AppTextStyles.headingSmall,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "\$${item['price']}.00",
                                      style: AppTextStyles.bodySmall,
                                      maxLines: 2,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            int.parse(
                                                  item['quantity']
                                                          ?.toString() ??
                                                      '0',
                                                ) <
                                                5
                                            ? AppColors.errorBg
                                            : AppColors.bgChip,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        child: Text(
                                          "${item['quantity']} in Stock",
                                          style: int.parse(
                                            item['quantity']
                                                ?.toString() ??
                                                '0',
                                          ) <
                                              5
                                              ? AppTextStyles.labelSmall.copyWith(color : AppColors.errorLabel)
                                              : AppTextStyles.labelSmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.more_vert_rounded),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: AppStrings.myProductsList.length,
              ),
            ),
          ],
        ),
      );
  }
}
