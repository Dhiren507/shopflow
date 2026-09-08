import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_routes.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class MyProductsListingScreen extends StatefulWidget {
  const MyProductsListingScreen({super.key});

  @override
  State<MyProductsListingScreen> createState() =>
      _MyProductsListingScreenState();
}

class _MyProductsListingScreenState extends State<MyProductsListingScreen> {
  int activeTabIndex = 1;
  final List<String> tabs = ['Active', 'Draft'];

  final List<Map<String, dynamic>> myProductsList = [
    {
      'id': '1',
      'name': 'Geometric Brass Desk Lamp',
      'quantity': '240',
      'price': '40',
    },
    {
      'id': '2',
      'name': 'Ergonomic Leather Office Chair',
      'quantity': '15',
      'price': '180',
    },
    {
      'id': '3',
      'name': 'Minimalist Ceramic Coffee Mug',
      'quantity': '3', // Less than 5
      'price': '15',
    },
    {'id': '4', 'name': 'Bamboo Laptop Stand', 'quantity': '85', 'price': '35'},
    {
      'id': '5',
      'name': 'Noise-Canceling Wireless Earbuds',
      'quantity': '2', // Less than 5
      'price': '120',
    },
    {
      'id': '6',
      'name': 'Waterproof Sports Smartwatch',
      'quantity': '60',
      'price': '95',
    },
    {
      'id': '7',
      'name': 'Premium Leather Journal Notebook',
      'quantity': '1', // Less than 5
      'price': '22',
    },
    {
      'id': '8',
      'name': 'Portable Bluetooth Speaker',
      'quantity': '110',
      'price': '50',
    },
    {
      'id': '9',
      'name': 'Adjustable Aluminium Tripod',
      'quantity': '4', // Less than 5
      'price': '45',
    },
    {
      'id': '10',
      'name': 'Dual-Port Fast Wall Charger',
      'quantity': '350',
      'price': '18',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('My Products', style: AppTextStyles.headingLarge),
            Row(
              spacing: 5,
              children: [
                Text('12 items', style: AppTextStyles.bodySmall),
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
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.5),
                    offset: Offset(0, 0.5),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = activeTabIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => activeTabIndex = index),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.textOnDark
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          tabs[index],
                          style: AppTextStyles.headingSmall.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textHint,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final item = myProductsList[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 23,
                      ),
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
                                        borderRadius: BorderRadius.circular(6),
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
                itemCount: myProductsList.length,
              ),
            ),
          ],
        ),
      );
  }
}
