import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_app_bar.dart';
import 'package:shopflow/features/seller/constants/seller_constants.dart';
import 'package:shopflow/features/seller/widgets/stat_card.dart';
import 'package:shopflow/features/seller/widgets/stock_level_progress_indicator.dart';

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppStrings.sellerDashboardText,
              style: AppTextStyles.headingMedium,
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.sellerDashboardSubheadingText,
              style: AppTextStyles.bodyMedium,
            ),

            const SizedBox(height: 25),

            ...List.generate(SellerConstants.statCardData.length, (index) {
              final cardData = SellerConstants.statCardData[index];
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

            SizedBox(
              width: double.maxFinite,
              child: Card(
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        AppStrings.categoryBreakdownText,
                        style: AppTextStyles.headingMedium,
                      ),
                      const SizedBox(height: 10),

                      Center(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: PieChart(
                            PieChartData(
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: [
                                ...List.generate(
                                  SellerConstants.pieChartData.length,
                                  (index) {
                                    final item =
                                        SellerConstants.pieChartData[index];
                                    return PieChartSectionData(
                                      color: item['color'],
                                      value: double.parse(
                                        item['valuePercentage'].toString(),
                                      ),
                                      showTitle: false,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Column(
                        spacing: 15,
                        children: List.generate(
                          SellerConstants.pieChartData.length,
                          (index) {
                            final item = SellerConstants.pieChartData[index];
                            return Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    color: item['color'],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  item["categoryName"],
                                  style: AppTextStyles.bodySmall,
                                ),
                                const Spacer(),
                                Text(
                                  '${item["valuePercentage"]}%',
                                  style: AppTextStyles.headingSmall,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

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
                          AppStrings.stockLevelsText,
                          style: AppTextStyles.headingMedium,
                        ),
                        Text(
                          AppStrings.viewAllReviews,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Column(
                      spacing: 15,
                      children: List.generate(
                        SellerConstants.stockData.length,
                        (index) {
                          final item = SellerConstants.stockData[index];

                          return StockLevelProgressIndicator(
                            label: item['label'].toString(),
                            value:
                                int.tryParse(item['value']?.toString() ?? '') ??
                                0,
                            totalStock:
                                int.tryParse(
                                  item['totalStock']?.toString() ?? '',
                                ) ??
                                0,
                            barColor: item['color'],
                          );
                        },
                      ),
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
                      AppStrings.topRatedProductsText,
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
                      final product = SellerConstants.productList[index];
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
                    itemCount: SellerConstants.productList.length,
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
