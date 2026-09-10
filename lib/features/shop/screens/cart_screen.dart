import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/features/shop/constants/shop_constants.dart';
import 'package:shopflow/features/shop/models/product_model.dart';
import 'package:shopflow/features/shop/widgets/cart_item_card.dart';
import 'package:shopflow/features/shop/widgets/empty_cart_placeholder.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCartEmpty = ShopConstants.cartItems.isEmpty;

  double totalOriginalPrice = 0.0;
  double totalDiscountAmount = 0.0;
  double finalPayoutAmount = 0.0;

  void calculateTotals() {
    double tempOriginal = 0.0;
    double tempDiscount = 0.0;

    for (var item in ShopConstants.cartItems) {
      final num price = item.price ?? 0.0;
      final num discountPercent = item.discount ?? 0.0;
      final int qty = item.productQuantity ?? 1;

      tempOriginal += price * qty;

      double discountPerUnit = price * (discountPercent / 100);
      tempDiscount += discountPerUnit * qty;
    }

    totalOriginalPrice = tempOriginal;
    totalDiscountAmount = tempDiscount;

    finalPayoutAmount = totalOriginalPrice - totalDiscountAmount;
    if (finalPayoutAmount < 0) finalPayoutAmount = 0.0;
  }

  @override
  void initState() {
    // TODO: implement initState
    calculateTotals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(AppStrings.yourCartTitle, style: AppTextStyles.headingLarge),
          Text('${ShopConstants.cartItems.length} items', style: AppTextStyles.bodySmall),

          const SizedBox(height: 15),

          isCartEmpty
              ? Expanded(child: EmptyCartPlaceholder())
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: ShopConstants.cartItems.length,

                    itemBuilder: (context, index) {
                      final ProductModel item = ShopConstants.cartItems[index];

                      return CartItemCard(
                        productTitle: item.title ?? '',
                        productColor: item.category?.name ?? '',
                        productPrice: item.price ?? 0,
                        productImagePath: item.images?.first ?? '',
                        productQuantity: item.productQuantity ?? 1,
                        productDiscount: item.discount ?? 0,
                        onDecrement: () {
                          if (item.productQuantity! > 1) {
                            setState(() {
                              item.productQuantity = item.productQuantity! - 1;
                              calculateTotals();
                            });
                          }
                        },
                        onIncrement: () {
                          if (item.productQuantity! < 10) {
                            setState(() {
                              item.productQuantity = item.productQuantity! + 1;
                              calculateTotals();
                            });
                          }
                        },
                        onClose: () {
                          if(index > 0) {
                            setState(() {
                              ShopConstants.cartItems.removeAt(index);
                              calculateTotals();
                            });
                          } else {
                            setState(() {
                              ShopConstants.cartItems.removeAt(index);
                              calculateTotals();
                              isCartEmpty = true;
                            });
                          }
                        },
                      );
                    },
                  ),
                ),
          const SizedBox(height: 10),
          !isCartEmpty
              ? CommonButton(
                  label: 'Proceed To Checkout',
                  onPressed: () {
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
                                    '\$$totalOriginalPrice',
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
                                    '-\$$totalDiscountAmount',
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
                                    '\$$finalPayoutAmount',
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
      ),
    );
  }
}
