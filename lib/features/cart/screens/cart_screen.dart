import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/features/cart/providers/cart_provider.dart';
import 'package:shopflow/core/utils/price_calculation_utils.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/features/home/models/product_model.dart';
import 'package:shopflow/features/cart/widgets/cart_item_card.dart';
import 'package:shopflow/features/cart/widgets/empty_cart_placeholder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Consumer<CartProvider>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: .start,
          children: [
            Text(AppStrings.yourCartTitle, style: AppTextStyles.headingLarge),
            Text(
              '${provider.cartItems.length} items',
              style: AppTextStyles.bodySmall,
            ),

            const SizedBox(height: 15),

            provider.cartItems.isEmpty
                ? Expanded(child: EmptyCartPlaceholder())
                : Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                const SizedBox(height: 5),
                itemCount: provider.cartItems.length,

                itemBuilder: (context, index) {
                  final ProductModel item = provider.cartItems[index];

                  return CartItemCard(
                    productTitle: item.title ?? '',
                    productColor: item.category?.name ?? '',
                    productPrice: item.price ?? 0,
                    productImagePath: item.images?.first ?? '',
                    productQuantity: item.productQuantity ?? 1,
                    productDiscount: item.discount ?? 0,
                    onDecrement: () {
                      if (item.productQuantity! > 1) {
                        provider.decreaseProductQuantity(index);
                      }
                    },
                    onIncrement: () {
                      if (item.productQuantity! < 10) {
                        provider.increaseProductQuantity(index);
                      }
                    },
                    onClose: () {
                      provider.removeProduct(index);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            provider.cartItems.isNotEmpty
                ? CommonButton(
              label: 'Proceed To Checkout',
              onPressed: () {
                Map<String, num> totals =
                PriceCalculationUtils.calculateCartTotals(
                 provider.cartItems
                );
                showModalBottomSheet(
                  context: context,
                  showDragHandle: false,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
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
                            children: [
                              Text(
                                AppStrings.subTotalText,
                                style: AppTextStyles.bodySmall,
                              ),
                              Text(
                                "\$${totals['totalCartAmount']}",
                                style: AppTextStyles.headingMedium,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                AppStrings.discountText,
                                style: AppTextStyles.bodySmall,
                              ),
                              Text(
                                "-\$${totals['totalCartDiscount']}",
                                style: AppTextStyles.headingMedium.copyWith(
                                  color: AppColors.errorLabel,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                AppStrings.deliveryText,
                                style: AppTextStyles.bodySmall,
                              ),
                              Text(
                                AppStrings.freeText,
                                style: AppTextStyles.strikethroughMedium,
                              ),
                            ],
                          ),
                          CommonDivider(),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                AppStrings.totalText,
                                style: AppTextStyles.headingMedium,
                              ),
                              Text(
                                "\$${totals['payableAmount']}",
                                style: AppTextStyles.headingLarge.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          CommonButton(
                            label: AppStrings.checkoutNowButtonText,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )
                : const SizedBox(),
          ],
        );
      },)
    );
  }
}
