import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/core/widgets/numeric_stepper_button.dart';
import 'package:shopflow/features/shop/widgets/empty_cart_placeholder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCartEmpty = false;

  int itemValue = 1;

  List<Map<String, dynamic>> cartItems = [
    {
      'id': '1',
      'title': 'Aura Studio Wireless Speaker System with Premium Sound',
      'color': 'Midnight Blue',
      'price': 299.00,
      'imageUrl': 'https://unsplash.com',
      'quantity': 1,
    },
    {
      'id': '2',
      'title': 'SoundLink Comfort Noise Cancelling Headphones',
      'color': 'Matte Black',
      'price': 349.50,
      'imageUrl': 'https://unsplash.com',
      'quantity': 2,
    },
    {
      'id': '3',
      'title': 'Minimalist Mechanical Keyboard 75%',
      'color': 'Chalk White / Anodized Aluminum Base Frame',
      'price': 159.00,
      'imageUrl': 'https://unsplash.com',
      'quantity': 1,
    },
    {
      'id': '4',
      'title': 'Ergonomic Wireless Mouse',
      'color': 'Space Gray',
      'price': 99.99,
      'imageUrl': 'https://unsplash.com',
      'quantity': 1,
    },
    {
      'id': '5',
      'title': 'Aura Studio Wireless Speaker System with Premium Sound',
      'color': 'Midnight Blue',
      'price': 299.00,
      'imageUrl': 'https://unsplash.com',
      'quantity': 1,
    },
    {
      'id': '6',
      'title': 'SoundLink Comfort Noise Cancelling Headphones',
      'color': 'Matte Black',
      'price': 349.50,
      'imageUrl': 'https://unsplash.com',
      'quantity': 2,
    },
    {
      'id': '7',
      'title': 'Minimalist Mechanical Keyboard 75%',
      'color': 'Chalk White / Anodized Aluminum Base Frame',
      'price': 159.00,
      'imageUrl': 'https://unsplash.com',
      'quantity': 1,
    },
    {
      'id': '8',
      'title': 'Ergonomic Wireless Mouse',
      'color': 'Space Gray',
      'price': 99.99,
      'imageUrl': 'https://unsplash.com',
      'quantity': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Your Cart', style: AppTextStyles.headingLarge),
          Text('2 items', style: AppTextStyles.bodySmall),

          isCartEmpty
              ? EmptyCartPlaceholder()
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: cartItems.length,

                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 23,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    8,
                                  ),
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
                                    Text(
                                      item['title'],
                                      style: AppTextStyles.headingSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Flexible(
                                      child: Text(
                                        item['color'],
                                        style: AppTextStyles.bodySmall,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Text(
                                      '\$299.00',
                                      style: AppTextStyles.headingSmall
                                          .copyWith(
                                            color: AppColors.primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: .end,
                                spacing: 10,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cartItems.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                  NumericStepperButton(
                                    onDecrement: () {},
                                    onIncrement: () {},
                                    value: item['quantity'],
                                    isSmall: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          !isCartEmpty ? CommonButton(
            label: 'Proceed To Checkout',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: false,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Column(
                      spacing: 15,
                      mainAxisSize: .min,
                      children: [
                        Container(
                          width: 48,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColors.border,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [Text('SubTotal', style: AppTextStyles.bodySmall,), Text('\$828.00', style: AppTextStyles.headingMedium,)],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [Text('Discount', style: AppTextStyles.bodySmall), Text('-\$28.00', style: AppTextStyles.headingMedium.copyWith(color: AppColors.errorLabel),)],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [Text('Delivery', style: AppTextStyles.bodySmall), Text('Free',  style: AppTextStyles.strikethroughMedium)],
                        ),
                        CommonDivider(),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [Text('Total', style: AppTextStyles.headingMedium,), Text('\$828.00', style: AppTextStyles.headingLarge.copyWith(color: AppColors.primary),)],
                        ),
                        CommonButton(label: 'Checkout Now', onPressed: () {})
                      ],
                    ),
                  );
                },
              );
            },
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
