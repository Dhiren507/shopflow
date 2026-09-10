import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/features/shop/constants/shop_constants.dart';

import '../../../core/constants/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<void> _handleRefresh() async {

}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilterOption = 'Tech';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgScreen,
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        color : AppColors.white,
        backgroundColor: AppColors.primary,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              children: [
                // top filtering tiles
                SizedBox(
                  height: 36,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool isSelected =
                          selectedFilterOption ==
                          ShopConstants.allowedFilterOptions[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilterOption =
                                ShopConstants.allowedFilterOptions[index];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : AppColors.white,
                            border: Border.all(color: AppColors.textHint, width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            ShopConstants.allowedFilterOptions[index],
                            style: AppTextStyles.labelSmall.copyWith(
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.textHint,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemCount: ShopConstants.allowedFilterOptions.length,
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: AlignedGridView.count(
                    itemCount: ShopConstants.mockProducts.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemBuilder: (context, index) {
                      var product = ShopConstants.mockProducts[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.bgCard,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withAlpha(5),
                              offset: const Offset(0, 8),
                              blurRadius: 12,
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.productDetailScreen,
                                arguments: product,
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.black,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(6),
                                          child: Image.network(
                                            'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
          
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            product.isLiked =
                                                !(product.isLiked ?? false);
                                          });
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: (product.isLiked ?? false)
                                              ? Icon(
                                                  Icons.favorite,
                                                  color: AppColors.darkRed,
                                                )
                                              : Icon(
                                                  Icons.favorite_outline_outlined,
                                                ),  
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
          
                                const SizedBox(height: 6),
          
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      product.category?.name ?? '',
                                      style: AppTextStyles.labelSmall,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      product.title ?? '',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
          
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppImages.ratingStar,
                                          height: 11,
                                          width: 11,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${product.ratings?.avgRating}',
                                          style: AppTextStyles.bodyMedium.copyWith(
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '(${product.ratings?.totalReviews})',
                                          style: AppTextStyles.labelSmall,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 7),
          
                                    Wrap(
                                      spacing: 4,
                                      runSpacing: 2,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        Text(
                                          '\$${product.price}',
                                          style: AppTextStyles.headingMedium,
                                        ),
                                        const Text(
                                          r"$300",
                                          style: AppTextStyles.strikethroughSmall,
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
                                            '-${product.discount}%',
                                            style:AppTextStyles.whiteSmallLabel,
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
        ),
      ),
    );
  }
}
