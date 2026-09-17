import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/features/cart/providers/cart_provider.dart';
import 'package:shopflow/features/home/providers/product_detail_provider.dart';
import 'package:shopflow/core/utils/price_calculation_utils.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/core/widgets/common_expansion_tile.dart';
import 'package:shopflow/core/widgets/numeric_stepper_button.dart';
import 'package:shopflow/core/widgets/product_rating_stars.dart';
import 'package:shopflow/core/models/product_model.dart';
import 'package:shopflow/features/home/widgets/rating_section.dart';

import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/common_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int reviewListDefaultLength = 2;
  int? totalReviews;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int selectedProductId =
          ModalRoute.of(context)!.settings.arguments as int;
      context.read<ProductDetailProvider>().fetchProductDetail(
        selectedProductId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build method called!!!');

    return Scaffold(
      backgroundColor: AppColors.bgScreen,
      body: Consumer<ProductDetailProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: const CircularProgressIndicator());
          }

          final ProductModel selectedProduct = provider.selectedProduct!;

          totalReviews = selectedProduct.productReviews?.length ?? 0;

          final productAmounts = PriceCalculationUtils.calculateProductPrice(
            selectedProduct.price ?? 0.0,
            selectedProduct.discount ?? 0,
          );

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      items: selectedProduct.images
                          ?.map(
                            (image) => Container(
                              color: AppColors.bgTile,
                              width: double.maxFinite,
                              child: CachedNetworkImage(
                                imageUrl: image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: const Text('Loading...')),
                                errorWidget: (context, url, error) {
                                  return Icon(
                                    Icons.hide_image,
                                    color: AppColors.black,
                                  );
                                },
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: null,
                        aspectRatio: 390 / 400,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          provider.setImageIndex(index);
                        },
                      ),
                    ),

                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      left: 25,
                      right: 25,
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: AppColors.bgCard,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: AppColors.bgCard,
                                shape: BoxShape.circle,
                              ),
                              child: (selectedProduct.isLiked ?? false)
                                  ? Icon(
                                      Icons.favorite,
                                      color: AppColors.darkRed,
                                    )
                                  : Icon(Icons.favorite_outline_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 25,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          selectedProduct.images?.length ?? 0,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: provider.selectedImageIndex == index
                                  ? AppColors.primary
                                  : AppColors.divider,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        '${selectedProduct.brandName?.toUpperCase()}',
                        style: AppTextStyles.labelSmall,
                      ),
                      Text(
                        '${selectedProduct.title}',
                        style: AppTextStyles.headingLarge,
                      ),
                      Row(
                        spacing: 6,
                        children: [
                          ProductRatingStars(
                            rating: selectedProduct.ratings?.avgRating ?? 0,
                          ),
                          Text(
                            '${selectedProduct.ratings?.avgRating} (${selectedProduct.ratings?.totalReviews} reviews)',
                            style: AppTextStyles.labelSmall,
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              color: AppColors.border,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadiusGeometry.circular(16),
                            ),
                            child: Text(
                              selectedProduct.productStock! > 0
                                  ? 'In Stock'
                                  : 'Out of Stock',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.primaryDim,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        spacing: 15,
                        children: [
                          Text(
                            "\$${productAmounts['finalPrice']}",
                            style: AppTextStyles.headingLarge,
                          ),
                          Text(
                            '\$${selectedProduct.price}',
                            style: AppTextStyles.strikethroughMedium,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.saleBadge,
                              borderRadius: BorderRadiusGeometry.circular(16),
                            ),
                            child: Text(
                              "Save \$${productAmounts['finalPrice']}",
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.primaryDim,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const CommonDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        AppStrings.quantitySectionText,
                        style: AppTextStyles.headingMedium,
                      ),
                      NumericStepperButton(
                        onDecrement: () {
                          if (selectedProduct.productQuantity! > 1) {
                            int? newQuant =
                                selectedProduct.productQuantity! - 1;
                            provider.setProductQuantity(newQuant);
                          }
                        },
                        onIncrement: () {
                          if (selectedProduct.productQuantity! < 10) {
                            int? newQuant =
                                selectedProduct.productQuantity! + 1;
                            provider.setProductQuantity(newQuant);
                          }
                        },
                        value: selectedProduct.productQuantity ?? 0,
                      ),
                    ],
                  ),
                ),
                const CommonDivider(),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 24,
                  ),
                  child: CommonExpansionTile(
                    headerTitle: AppStrings.productDescriptionHeaderText,
                    inputFields: [
                      HtmlWidget(
                        selectedProduct.description ?? '',
                        textStyle: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),

                const CommonDivider(),

                Container(
                  decoration: BoxDecoration(color: AppColors.bgChip),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),

                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          AppStrings.reviewSectionHeaderText,
                          style: AppTextStyles.headingMedium,
                        ),
                        const SizedBox(height: 10),
                        RatingSection(
                          totalRating: selectedProduct.ratings?.avgRating ?? 0,
                          totalReviews:
                              selectedProduct.ratings?.totalReviews ?? 0,
                          fiveStarReviewCount:
                              selectedProduct.ratings?.fiveStarReviewCount ?? 0,
                          fourStarReviewCount:
                              selectedProduct.ratings?.fourStarReviewCount ?? 0,
                          threeStarReviewCount:
                              selectedProduct.ratings?.threeStarReviewCount ??
                              0,
                          twoStarReviewCount:
                              selectedProduct.ratings?.twoStarReviewCount ?? 0,
                          oneStarReviewCount:
                              selectedProduct.ratings?.oneStarReviewCount ?? 0,
                        ),
                        const SizedBox(height: 20),

                        (totalReviews ?? 0) != 0
                            ? ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: provider.isReviewListExpanded
                                    ? (totalReviews ?? 0)
                                    : min(
                                        reviewListDefaultLength,
                                        (totalReviews ?? 0),
                                      ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 5),
                                itemBuilder: (context, index) {
                                  CustomerReview reviewItem =
                                      selectedProduct.productReviews![index];
                                  return Card(
                                    color: AppColors.bgCard,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: .start,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                  reviewItem.userImage ?? '',
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment: .start,
                                                children: [
                                                  Text(
                                                    reviewItem.username ?? '',
                                                    style: AppTextStyles
                                                        .headingSmall,
                                                  ),
                                                  Text(
                                                    'Oct 12, 2023',
                                                    style: AppTextStyles
                                                        .labelSmall,
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              ProductRatingStars(
                                                rating: reviewItem.rating ?? 0,
                                              ),
                                            ],
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              reviewItem.reviewText ?? '',
                                              style: AppTextStyles.bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Text(AppStrings.noProductReviewsText),

                        const SizedBox(height: 10),

                        if ((totalReviews ?? 0) > reviewListDefaultLength)
                          CommonButton(
                            label: provider.isReviewListExpanded
                                ? AppStrings.showLessReviewsText
                                : AppStrings.viewAllReviews,
                            onPressed: () {
                              provider.setReviewListExpanded(
                                !provider.isReviewListExpanded,
                              );
                            },
                            borderRadius: 22,
                            backgroundColor: AppColors.bgChip,
                            textColor: AppColors.black,
                            elevation: 0,
                            borderSide: BorderSide(color: AppColors.border),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Consumer<ProductDetailProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const SizedBox();
          }

          final selectedProduct = provider.selectedProduct;

          return BottomAppBar(
            color: AppColors.bgCard,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Cleaner text alignment
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.totalPriceText,
                        style: AppTextStyles.labelSmall,
                      ),
                      Text(
                        '\$${selectedProduct?.price}.00',
                        style: AppTextStyles.headingMedium,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CommonButton(
                      label: AppStrings.addToCartText,
                      onPressed: () {
                        if (selectedProduct == null) return;

                        final cartProvider = context.read<CartProvider>();

                        final bool isNewItem = cartProvider.addProduct(selectedProduct);

                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isNewItem
                                  ? 'Product Added to Cart'
                                  : 'Cart quantity increased',
                            ),
                          ),
                        );
                      },
                      borderRadius: 22,
                      leadingIcon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
