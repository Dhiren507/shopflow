import 'dart:io';

import 'package:dashed_border/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/services/image_picker_service.dart';
import 'package:shopflow/core/widgets/common_app_bar.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/core/widgets/common_input_field.dart';
import 'package:shopflow/features/shop/constants/shop_constants.dart';
import 'package:shopflow/features/shop/screens/add_product/models/product_form_model.dart';

import '../../../../core/utils/image_picker_helper.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final ProductFormModel _currentForm = ProductFormModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _currentForm.dispose();
    super.dispose();
  }

  void calculateFinalPrice() {
    final num originalPrice = num.tryParse(_currentForm.originalPriceController.text) ?? 0;
    final int discount = int.tryParse(_currentForm.discountController.text) ?? 0;

    final finalPrice = originalPrice * (1 - (discount / 100));

    setState(() {
      _currentForm.calculatedFinalPrice = finalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Tooltip(
              message: AppStrings.addProductHelperText,
              triggerMode: TooltipTriggerMode.tap,
              child: Icon(Icons.help_outline, color: AppColors.textHint),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        title: AppStrings.addProductTitle,
        textColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(AppStrings.productImagesText, style: AppTextStyles.headingSmall),
            Text(
              AppStrings.uploadImagesSubText,
              style: AppTextStyles.bodySmall,
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 80,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: _currentForm.selectedImagePaths.length < 7
                    ? _currentForm.selectedImagePaths.length + 1
                    : 7,
                itemBuilder: (context, index) {
                  final isLastContainer =
                      index == _currentForm.selectedImagePaths.length;
                  final imagePath = isLastContainer
                      ? ''
                      : _currentForm.selectedImagePaths[index];

                  return GestureDetector(
                    onTap: () async {
                      if (isLastContainer) {
                        final imgPath =
                            await pickImageFromGallery();
                        if (imgPath != null) {
                          setState(() {
                            _currentForm.selectedImagePaths.add(imgPath);
                          });
                        }
                      }
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                            border: isLastContainer
                                ? DashedBorder(
                                    color: AppColors.border,
                                    width: 2,
                                  )
                                : Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child: isLastContainer
                              ? SvgPicture.asset(
                                  AppImages.addImageEmptyPlaceholder,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.textHint,
                                    BlendMode.srcIn,
                                  ),
                                  height: 18,
                                  width: 18,
                                  fit: BoxFit.scaleDown,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        if (!isLastContainer)
                          Positioned(
                            right: -10,
                            top: -8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentForm.selectedImagePaths.removeAt(
                                    index,
                                  );
                                });
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.errorBg,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.close, size: 15),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 15),
              ),
            ),
            const CommonDivider(height: 25),

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CommonInputField(
                    controller: _currentForm.titleController,
                    labelText: AppStrings.productTitleLabel,
                    hasLabelPadding: false,
                    hintText: AppStrings.productTitleHint,
                    labelTrailing: Text('*', style: AppTextStyles.errorText),

                    validator: (String? value) {
                      if (value == 'null') {
                        return AppStrings.productTitleError;
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  CommonInputField(
                    controller: _currentForm.descriptionController,
                    labelText: AppStrings.productDescriptionLabel,
                    isMultiline: true,
                    maxLines: 3,
                    hintText: AppStrings.productDescriptionHint,

                    validator: (String? value) {
                      if (value == 'null') {
                        return AppStrings.productDescriptionError;
                      }
                      return null;
                    },
                  ),

                  const CommonDivider(height: 50),

                  Row(
                    children: [
                      Expanded(
                        child: CommonInputField(
                          labelText: AppStrings.originalPriceLabel,
                          controller: _currentForm.originalPriceController,
                          keyboardType: .number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3)
                          ],
                          onChanged: (_) => calculateFinalPrice(),
                          leadingIcon: Icon(
                            Icons.attach_money,
                            size: 18,
                            color: AppColors.textHint,
                          ),
                          hintText: AppStrings.originalPriceHint,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: CommonInputField(
                          labelText: AppStrings.discountLabel,
                          controller: _currentForm.discountController,
                          keyboardType: .number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3)
                          ],
                          onChanged: (_) => calculateFinalPrice(),
                          suffixIcon: Icon(
                            Icons.percent_rounded,
                            size: 18,
                            color: AppColors.textHint,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            color: AppColors.primary,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Final Price : \$${_currentForm.calculatedFinalPrice}",
                            style: AppTextStyles.headingSmall.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const CommonDivider(height: 50),
                  Text(AppStrings.categoryLabel, style: AppTextStyles.labelSmall),
                  const SizedBox(height: 5),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField<String>(
                      initialValue:
                          _currentForm.selectedCategory ??
                          AppStrings.selectCategoryHint,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.bgCard,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: AppColors.border,
                            width: 1,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: AppColors.border,
                            width: 2,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: AppColors.errorText),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: AppColors.errorText),
                        ),
                      ),

                      onChanged: (String? value) {
                        setState(() {
                          _currentForm.selectedCategory = value;
                        });
                      },

                      validator: (String? value) {
                        if (value == null ||
                            value == AppStrings.selectCategoryHint) {
                          return AppStrings.selectCategoryError;
                        }
                        return null;
                      },
                      items: [
                        const DropdownMenuItem<String>(
                          value: AppStrings.selectCategoryHint,
                          child: Text(AppStrings.selectCategoryHint),
                        ),
                        ...ShopConstants.productCategories.map((String opt) {
                          return DropdownMenuItem<String>(
                            value: opt,
                            child: Text(opt),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(AppStrings.inventoryStockLabel, style: AppTextStyles.labelSmall),
                  const SizedBox(height: 5),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.bgCard,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_currentForm.stock > 1) {
                              setState(() {
                                --_currentForm.stock;
                              });
                            }
                          },
                          iconSize: 20,
                          padding: const EdgeInsets.all(8),
                          icon: const Icon(Icons.remove),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppColors.bgScreen,
                            border: Border(
                              left: BorderSide(
                                color: AppColors.border,
                                width: 1.0,
                              ),
                              right: BorderSide(
                                color: AppColors.border,
                                width: 1.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${_currentForm.stock}',
                            style: AppTextStyles.headingSmall.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (_currentForm.stock < 100) {
                              setState(() {
                                ++_currentForm.stock;
                              });
                            }
                          },
                          iconSize: 20,
                          padding: const EdgeInsets.all(8),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: CommonButton(
          label: AppStrings.saveProductButtonText,
          onPressed: () {},
          leadingIcon: Icon(Icons.save, color: AppColors.bgCard),
        ),
      ),
    );
  }
}
