import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_strings.dart';

class SellerConstants {
  static final List<Map<String, dynamic>> statCardData = [
    {
      'leadingIconPath': AppImages.productCartIcon,
      'leadingIconBgColor': AppColors.primaryLight.withValues(alpha: 0.2),
      'suffixIconPath': AppImages.progressUpIcon,
      'suffixIconBgColor': AppColors.errorBg.withValues(alpha: 0.5),
      'mainTitle': AppStrings.totalProductsText,
      'value': 1245,
      'progressValue': 12,
      'isRatingCard': false,
    },
    {
      'leadingIconPath': AppImages.stockBarIcon,
      'leadingIconBgColor': AppColors.statIconRedBgColor.withValues(alpha: 0.2),
      'suffixIconPath': AppImages.nextArrowIcon,
      'suffixIconBgColor': AppColors.divider,
      'mainTitle': AppStrings.totalStockText,
      'value': 8342,
      'progressValue': 0,
      'isRatingCard': false,
    },
    {
      'leadingIconPath': AppImages.ratingStarIcon,
      'leadingIconBgColor': AppColors.primaryLight.withValues(alpha: 0.2),
      'suffixIconPath': AppImages.progressUpIcon,
      'suffixIconBgColor': AppColors.errorBg.withValues(alpha: 0.5),
      'mainTitle': AppStrings.averageRatingText,
      'value': 4.8,
      'progressValue': 0.2,
      'isRatingCard': true,
    },
  ];

  static final List<Map<String, dynamic>> productList = [
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

  static final List<Map<String, dynamic>> stockData = [
    {
      'label': 'Smartphones',
      'value': 2600,
      'totalStock': 3200,
      'barColor': AppColors.primary,
    },
    {
      'label': 'Laptops',
      'value': 1800,
      'totalStock': 3200,
      'barColor': AppColors.primaryLight,
    },
    {
      'label': 'Accessories',
      'value': 2200,
      'totalStock': 3000,
      'barColor': AppColors.textSecondary,
    },
    {
      'label': 'Audio Devices',
      'value': 150,
      'totalStock': 1200,
      'barColor': null,
    },
  ];

  static final List<Map<String, dynamic>> pieChartData = [
    {
      "id": "c1",
      "categoryName": "Electronics",
      "valuePercentage": 45,
      "color": AppColors.primary,
    },
    {
      "id": "c2",
      "categoryName": "Clothing",
      "valuePercentage": 30,
      "color": AppColors.saleBadge,
    },
    {
      "id": "c2",
      "categoryName": "Home Goods",
      "valuePercentage": 10,
      "color": AppColors.brownColor,
    },
    {
      "id": "c2",
      "categoryName": "Other",
      "valuePercentage": 15,
      "color": AppColors.divider,
    },
  ];
}