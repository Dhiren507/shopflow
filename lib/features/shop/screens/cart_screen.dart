import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/numeric_stepper_button.dart';
import 'package:shopflow/features/shop/screens/empty_cart_placeholder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCartEmpty = false;

  int itemValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Your Cart', style: AppTextStyles.displayMedium),
          Text('2 items', style: AppTextStyles.bodySmall),

          isCartEmpty
              ? EmptyCartPlaceholder()
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
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
                              Column(
                                crossAxisAlignment: .start,
                                spacing: 10,
                                children: [
                                  Text(
                                    'Aura Studio',
                                    style: AppTextStyles.displaySmallSemiBold,
                                  ),
                                  Text(
                                    'MidnightBlue',
                                    style: AppTextStyles.bodySmall,
                                  ),
                                  Text(
                                    '\$299.00',
                                    style: AppTextStyles
                                        .coloredDisplayTextSmallSemiBold,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: .end,
                                spacing: 10,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.close),
                                  ),
                                  NumericStepperButton(
                                    onDecrement: () {},
                                    onIncrement: () {},
                                    value: 500,
                                    isSmall: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: 10,
                  ),
                ),
        ],
      ),
    );
  }
}
