import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_app_bar.dart';
import 'package:shopflow/features/seller/widgets/stat_card.dart';
import 'package:shopflow/features/seller/widgets/stock_level_progress_indicator.dart';

class SellerDashboardScreen extends StatelessWidget {
  SellerDashboardScreen({super.key});

  final List<Map<String, dynamic>> statCardData = [
    {
      'leadingIconPath': AppImages.productCartIcon,
      'leadingIconBgColor': AppColors.primaryLight.withValues(alpha: 0.2),
      'suffixIconPath': AppImages.progressUpIcon,
      'suffixIconBgColor': AppColors.errorBg.withValues(alpha: 0.5),
      'mainTitle': 'TOTAL STOCK',
      'value': 1245,
      'progressValue': 12,
      'isRatingCard': false,
    },
    {
      'leadingIconPath': AppImages.stockBarIcon,
      'leadingIconBgColor': AppColors.statIconRedBgColor.withValues(alpha: 0.2),
      'suffixIconPath': AppImages.nextArrowIcon,
      'suffixIconBgColor': AppColors.divider,
      'mainTitle': 'TOTAL STOCK',
      'value': 8342,
      'progressValue': 0,
      'isRatingCard': false,
    },
    {
      'leadingIconPath': AppImages.ratingStarIcon,
      'leadingIconBgColor': AppColors.primaryLight.withValues(alpha: 0.2),
      'suffixIconPath': AppImages.progressUpIcon,
      'suffixIconBgColor': AppColors.errorBg.withValues(alpha: 0.5),
      'mainTitle': 'AVG. RATING',
      'value': 4.8,
      'progressValue': 0.2,
      'isRatingCard': true,
    },
  ];

  List<Map<String, dynamic>> productList = [
    {
      "id": "p1",
      "name": "ProX Smartphone 5G",
      "imageUrl": "assets/images/prox_smartphone.png",
      "rating": 4.9,
      "reviewCount": 120,
      "price": 899.00,
      "stockCount": 140,
    },
    {
      "id": "p2",
      "name": "AlphaTab Ultra 11",
      "imageUrl": "assets/images/alphatab_ultra.png",
      "rating": 4.7,
      "reviewCount": 85,
      "price": 649.99,
      "stockCount": 45,
    },
    {
      "id": "p3",
      "name": "WaveSound ANC Headphones",
      "imageUrl": "assets/images/wavesound_headphones.png",
      "rating": 4.8,
      "reviewCount": 312,
      "price": 249.00,
      "stockCount": 89,
    },
    {
      "id": "p4",
      "name": "Quantum Watch Series 4",
      "imageUrl": "assets/images/quantum_watch.png",
      "rating": 4.6,
      "reviewCount": 94,
      "price": 349.50,
      "stockCount": 12,
    },
    {
      "id": "p5",
      "name": "Apex Charge Pad Wireless",
      "imageUrl": "assets/images/apex_charge.png",
      "rating": 4.4,
      "reviewCount": 56,
      "price": 45.00,
      "stockCount": 210,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Seller Dashboard', style: AppTextStyles.headingMedium),
            const SizedBox(height: 10),
            Text(
              "Overview of your store's performance today.",
              style: AppTextStyles.bodyMedium,
            ),

            const SizedBox(height: 25),

            ...List.generate(statCardData.length, (index) {
              final cardData = statCardData[index];
              return StatCard(
                leadingIconPath: cardData['leadingIconPath'],
                leadingIconBgColor: cardData['leadingIconBgColor'],
                suffixIconPath: cardData['suffixIconPath'],
                suffixIconBgColor: cardData['suffixIconBgColor'],
                mainTitle: cardData['mainTitle'],
                value: cardData['value'],
                progressValue: cardData['progressValue'],
                isRatingCard: cardData['isRatingCard'],
              );
            }),

            const SizedBox(height: 15),

            Card(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Stock Levels',
                          style: AppTextStyles.headingMedium,
                        ),
                        Text(
                          'View Details',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Column(
                      spacing: 15,
                      children: [
                        StockLevelProgressIndicator(
                          label: 'Smartphones',
                          value: 2600,
                          totalStock: 3200,
                          barColor: AppColors.primary,
                        ),
                        StockLevelProgressIndicator(
                          label: 'Laptops',
                          value: 1800,
                          totalStock: 3200,
                          barColor: AppColors.primaryLight,
                        ),
                        StockLevelProgressIndicator(
                          label: 'Accessories',
                          value: 2200,
                          barColor: AppColors.textSecondary,
                          totalStock: 3000,
                        ),
                        StockLevelProgressIndicator(
                          label: 'Audio Devices',
                          value: 150,
                          totalStock: 1200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Top Rated Products',
                      style: AppTextStyles.headingMedium,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.textHint,
                      size: 25,
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 290,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return SizedBox(
                        width: 320,
                        child: Card(
                          elevation: 2,
                          color: AppColors.white,
                          child: Column(
                            children: [
                              // top image container
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: .only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: SizedBox(
                                  height: 160,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: .only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        "${product['name']}",
                                        style: AppTextStyles.headingMedium,
                                        overflow: .ellipsis,
                                      ),
                                      Row(
                                        spacing: 5,
                                        children: [
                                          SvgPicture.asset(
                                            AppImages.ratingStar,
                                            height: 13,
                                            width: 13,
                                            fit: BoxFit.scaleDown,
                                          ),
                                          Text(
                                            "${product['rating']}",
                                            style: AppTextStyles.bodyMedium
                                                .copyWith(
                                                  color: AppColors.textPrimary,
                                                ),
                                          ),
                                          Text(
                                            "(${product['reviewCount']} Reviews)",
                                            style: AppTextStyles.labelSmall,
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 10),

                                      Row(
                                        mainAxisAlignment: .spaceBetween,
                                        children: [
                                          Text(
                                            '\$${product['price']}',
                                            style: AppTextStyles
                                                .headingMediumBoldColored,
                                          ),
                                          Text(
                                            '${product['stockCount']} in Stock',
                                            style: AppTextStyles.labelSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 15);
                    },
                    itemCount: productList.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
