import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';

import '../../../core/constants/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final String _selectedFilterOption = 'All';
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            // top filtering tiles
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.offGreyColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(AppStrings.allowedFilterOptions[index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: AppStrings.allowedFilterOptions.length,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                itemCount: 40,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withAlpha(5),
                          offset: Offset(0, 8),
                          blurRadius: 12,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.productDetailScreen,
                          );
                        },
                        child: Column(
                          children: [
                            // heart stack on top image container
                            Stack(
                              children: [
                                Container(
                                  height: 143,
                                  width: 143,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      6,
                                    ),
                                    child: Image.network(
                                      'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppImages.likeHeart,
                                      height: 13,
                                      width: 15,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  'Tech',
                                  style: AppTextStyles.mutedGreyTextSmall,
                                ),

                                const SizedBox(height: 3),
                                const Text(
                                  'Too much long Product name should wrap',
                                  style: AppTextStyles.displaySmall,
                                  maxLines: 2,
                                  overflow: .ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  spacing: 4,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.ratingStar,
                                      height: 11,
                                      width: 11,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    const Text(
                                      '4.8',
                                      style: AppTextStyles.displaySmallBold,
                                    ),
                                    const Text(
                                      '(123)',
                                      style: AppTextStyles.mutedGreyTextSmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 7),
                                Row(
                                  spacing: 3,
                                  children: [
                                    const Text(
                                      r"$299",
                                      style: AppTextStyles.displayMediumBold,
                                    ),
                                    const Text(
                                      r"$300",
                                      style: AppTextStyles
                                          .mutedGreyTextSmallLineThrough,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.errorColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Text(
                                        '-20%',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
