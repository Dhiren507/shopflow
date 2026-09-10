import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/core/widgets/common_expansion_tile.dart';
import 'package:shopflow/core/widgets/numeric_stepper_button.dart';
import 'package:shopflow/core/widgets/product_rating_stars.dart';
import 'package:shopflow/features/shop/constants/shop_constants.dart';
import 'package:shopflow/features/shop/models/cart_item_model.dart';
import 'package:shopflow/features/shop/models/product_model.dart';
import 'package:shopflow/features/shop/widgets/rating_section.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/common_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentImageIndex = 0;
  int reviewListDefaultLength = 2;
  int? totalReviews;
  bool isReviewListExpanded = false;
  late ProductModel currentProduct;

  @override
  void initState() {
    super.initState();
  }

  void _handleDecrement() {
    if (_quantity > 1) {
      setState(() {
        --_quantity;
      });
    }
  }

  void _handleIncrement() {
    if (_quantity < 10) {
      setState(() {
        ++_quantity;
      });
    }
  }

  void addToCart(ProductModel chosenProduct) {
    setState(() {
      int existingIndex = ShopConstants.cartItems.indexWhere((item) => item.id == chosenProduct.id);

      if (existingIndex != -1) {
        ShopConstants.cartItems[existingIndex].productQuantity = ShopConstants.cartItems[existingIndex].productQuantity! + 1;
      } else {
        ShopConstants.cartItems.add(chosenProduct);
      }
    });
  }

  final List<String> imgList = [
    'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
    'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
    'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
  ];

  final Map<String, dynamic> mockProduct = {
    "success": true,
    "message": "Product details fetched successfully",
    "data": {
      "id": "watch_001",
      "brand": "LUMINA TECH",
      "name": "Aura Horizon Smartwatch Series 7",

      "images": [
        "https://example.com/watch-1.jpg",
        "https://example.com/watch-2.jpg",
        "https://example.com/watch-3.jpg",
        "https://example.com/watch-4.jpg",
      ],

      "rating": {
        "average": 4.8,
        "totalReviews": 1284,
        "distribution": {"5": 1120, "4": 95, "3": 40, "2": 18, "1": 11},
      },

      "availability": {"inStock": true, "label": "In Stock"},

      "pricing": {
        "currentPrice": 299.00,
        "originalPrice": 349.00,
        "currency": "USD",
        "discount": {"amount": 50.00, "label": "Save \$50"},
      },

      "quantity": {"minimum": 1, "maximum": 10, "default": 1},

      "description": "<p>Experience the next generation of <strong>wearable technology</strong>.</p><p>The Aura Horizon features a stunning edge-to-edge AMOLED display, advanced health tracking sensors, and a premium titanium casing designed for both durability and elegance.</p><ul><li>Always-on Retina display with 2000 nits peak brightness.</li><li>Advanced ECG and blood oxygen monitoring.</li><li>Up to 36 hours of battery life on a single charge.</li><li>Water-resistant up to 50 meters.</li></ul>",

      "reviews": [
        {
          "id": "review_001",
          "user": {
            "name": "Sarah Jenkins",
            "avatar": "https://example.com/sarah.jpg",
          },
          "rating": 5,
          "date": "2023-10-12",
          "comment":
              "Absolutely love the build quality. The battery easily "
              "lasts a day and a half with heavy usage. The sleep tracking "
              "is surprisingly accurate compared to my previous device.",
        },
        {
          "id": "review_002",
          "user": {
            "name": "Michael T.",
            "avatar": "https://example.com/michael.jpg",
          },
          "rating": 4,
          "date": "2023-10-05",
          "comment":
              "Great watch overall. The screen is incredibly bright even "
              "in direct sunlight. My only minor complaint is that the "
              "included strap could be slightly more breathable.",
        },
        {
          "id": "review_001",
          "user": {
            "name": "Sarah Jenkins",
            "avatar": "https://example.com/sarah.jpg",
          },
          "rating": 5,
          "date": "2023-10-12",
          "comment":
              "Absolutely love the build quality. The battery easily "
              "lasts a day and a half with heavy usage. The sleep tracking "
              "is surprisingly accurate compared to my previous device.",
        },
        {
          "id": "review_002",
          "user": {
            "name": "Michael T.",
            "avatar": "https://example.com/michael.jpg",
          },
          "rating": 4,
          "date": "2023-10-05",
          "comment":
              "Great watch overall. The screen is incredibly bright even "
              "in direct sunlight. My only minor complaint is that the "
              "included strap could be slightly more breathable.",
        },
        {
          "id": "review_001",
          "user": {
            "name": "Sarah Jenkins",
            "avatar": "https://example.com/sarah.jpg",
          },
          "rating": 5,
          "date": "2023-10-12",
          "comment":
              "Absolutely love the build quality. The battery easily "
              "lasts a day and a half with heavy usage. The sleep tracking "
              "is surprisingly accurate compared to my previous device.",
        },
        {
          "id": "review_002",
          "user": {
            "name": "Michael T.",
            "avatar": "https://example.com/michael.jpg",
          },
          "rating": 4,
          "date": "2023-10-05",
          "comment":
              "Great watch overall. The screen is incredibly bright even "
              "in direct sunlight. My only minor complaint is that the "
              "included strap could be slightly more breathable.",
        },
      ],
    },
  };

  void _handleReviewToggleButton() {
    setState(() {
      isReviewListExpanded = !isReviewListExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductModel selectedProduct =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    totalReviews = selectedProduct.productReviews?.length ?? 0;

    return Scaffold(
      backgroundColor: AppColors.bgScreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: imgList
                      .map(
                        (image) => Container(
                          color: AppColors.bgTile,
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 450,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: null,
                    aspectRatio: 390 / 400,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentImageIndex = index;
                      });
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
                          child: Icon(Icons.arrow_back, color: AppColors.black),
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
                              ? Icon(Icons.favorite, color: AppColors.darkRed)
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
                      imgList.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: _currentImageIndex == index
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                        '\$${selectedProduct.price}.00',
                        style: AppTextStyles.headingLarge,
                      ),
                      Text('\$399.0', style: AppTextStyles.strikethroughMedium),
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
                          r"Save $50",
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
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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
                        setState(() {
                          selectedProduct.productQuantity = selectedProduct.productQuantity! -1;
                        });
                      }
                    },
                    onIncrement: () {
                      if (selectedProduct.productQuantity! < 10) {
                        setState(() {
                          selectedProduct.productQuantity = selectedProduct.productQuantity!  + 1;
                        });
                      }
                    },
                    value: selectedProduct.productQuantity ?? 0,
                  ),
                ],
              ),
            ),
            const CommonDivider(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
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
                      totalReviews: selectedProduct.ratings?.totalReviews ?? 0,
                      fiveStarReviewCount:
                          selectedProduct.ratings?.fiveStarReviewCount ?? 0,
                      fourStarReviewCount:
                          selectedProduct.ratings?.fourStarReviewCount ?? 0,
                      threeStarReviewCount:
                          selectedProduct.ratings?.threeStarReviewCount ?? 0,
                      twoStarReviewCount:
                          selectedProduct.ratings?.twoStarReviewCount ?? 0,
                      oneStarReviewCount:
                          selectedProduct.ratings?.oneStarReviewCount ?? 0,
                    ),
                    const SizedBox(height: 20),

                    (totalReviews ?? 0) != 0
                        ? ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: isReviewListExpanded
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
                              var reviewItem =
                                  selectedProduct.productReviews?[index]
                                      as CustomerReview;
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
                                                style:
                                                    AppTextStyles.headingSmall,
                                              ),
                                              Text(
                                                'Oct 12, 2023',
                                                style: AppTextStyles.labelSmall,
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
                        label: isReviewListExpanded
                            ? AppStrings.showLessReviewsText
                            : AppStrings.viewAllReviews,
                        onPressed: _handleReviewToggleButton,
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
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.bgCard,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    AppStrings.totalPriceText,
                    style: AppTextStyles.labelSmall,
                  ),
                  Text(
                    '\$${selectedProduct.price}.00',
                    style: AppTextStyles.headingMedium,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CommonButton(
                  label: AppStrings.addToCartText,
                  onPressed: () {
                    addToCart(selectedProduct);
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
      ),
    );
  }
}
