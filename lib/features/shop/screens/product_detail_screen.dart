import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/widgets/product_rating_stars.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_text_styles.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentImageIndex = 0;
  final List<String> imgList = [
    'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
    'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
    'https://www.imageurlgenerator.com/_next/image?url=%2Fassets%2Ffree_tool.png&w=3840&q=75',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imgList
                    .map(
                      (image) => Container(
                        color: Colors.grey,
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
                          color: AppColors.white,
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
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          AppImages.likeHeart,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                            AppColors.black,
                            BlendMode.srcIn,
                          ),
                        ),
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
                            ? AppColors.primaryColor
                            : AppColors.greyDotColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('LUMINA TECH', style: AppTextStyles.mutedGreyTextSmall),
                  Text(
                    'Aura Horizon Smartwatch Series 7',
                    style: AppTextStyles.displayMedium,
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      ProductRatingStars(rating: 4.5),
                      Text(
                        '4.8 (1,284 reviews)',
                        style: AppTextStyles.mutedGreyTextSmall,
                      ),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                        child: Text(
                          'In Stock',
                          style: AppTextStyles.smallChipText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
