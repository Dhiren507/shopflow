import 'dart:io';

import 'package:dashed_border/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/services/image_picker_service.dart';
import 'package:shopflow/core/widgets/common_app_bar.dart';
import 'package:shopflow/core/widgets/common_button.dart';
import 'package:shopflow/core/widgets/common_divider.dart';
import 'package:shopflow/core/widgets/common_input_field.dart';
import 'package:shopflow/core/widgets/numeric_stepper_button.dart';
import 'package:shopflow/features/shop/constants/shop_constants.dart';
import 'package:shopflow/features/shop/screens/add_product/models/product_form_model.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final ProductFormModel _currentForm = ProductFormModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Tooltip(
              message: 'Helper Test when clicked on',
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
        title: 'Add Product',
        textColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Product Images', style: AppTextStyles.headingSmall),
            Text(
              'Upload up to 4 high-quality images.',
              style: AppTextStyles.bodySmall,
            ),
            const SizedBox(height: 10),
            // SizedBox(
            //   child: Row(
            //     mainAxisAlignment: .spaceBetween,
            //     children: List.generate(_currentForm.selectedImagePaths.length, (
            //       index,
            //     ) {
            //       return GestureDetector(
            //         onTap: () async {
            //           final imgPath =
            //               await ImagePickerService.pickImageFromGallery();
            //
            //           if (imgPath != null) {
            //             setState(() {
            //               _currentForm.selectedImagePaths[index] = imgPath;
            //             });
            //           }
            //         },
            //         child: Stack(
            //           children: [
            //             Container(
            //               height: 72,
            //               width: 72,
            //               decoration: BoxDecoration(
            //                 border: _currentForm.selectedImagePaths[index] == ''
            //                     ? DashedBorder(color: AppColors.border, width: 2)
            //                     : Border.all(color: Colors.transparent),
            //                 borderRadius: BorderRadius.circular(8),
            //                 color: AppColors.white
            //               ),
            //               child: _currentForm.selectedImagePaths[index] != ''
            //                   ? ClipRRect(
            //                 borderRadius: BorderRadius.circular(8),
            //                 child: Image.file(
            //                   File(_currentForm.selectedImagePaths[index]),
            //                   fit: BoxFit.cover,
            //                 ),
            //               )
            //                   : SvgPicture.asset(
            //                 AppImages.addImageEmptyPlaceholder,
            //                 colorFilter: ColorFilter.mode(
            //                   AppColors.textHint,
            //                   BlendMode.srcIn,
            //                 ),
            //                 height: 18,
            //                 width: 18,
            //                 fit: BoxFit.scaleDown,
            //               ),
            //             ),
            //             Positioned(
            //               right: 1,
            //               top: -10,
            //               child: Container(
            //                 height: 25,
            //                 width: 25,
            //                 decoration: BoxDecoration(
            //                   color: AppColors.errorBg,
            //                   shape: BoxShape.circle
            //                 ),
            //                 child: Icon(Icons.close, size: 15,),
            //               ),
            //             ),
            //           ]
            //         ),
            //       );
            //     }),
            //   ),
            // ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                clipBehavior: .none,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      final imgPath =
                          await ImagePickerService.pickImageFromGallery();

                      if (imgPath != null) {
                        setState(() {
                          _currentForm.selectedImagePaths[index] = imgPath;
                        });
                      }
                    },
                    child: Stack(
                      clipBehavior: .none,
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                            border: _currentForm.selectedImagePaths[index] == ''
                                ? DashedBorder(color: AppColors.border, width: 2)
                                : Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child: _currentForm.selectedImagePaths[index] != ''
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(_currentForm.selectedImagePaths[index]),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SvgPicture.asset(
                                  AppImages.addImageEmptyPlaceholder,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.textHint,
                                    BlendMode.srcIn,
                                  ),
                                  height: 18,
                                  width: 18,
                                  fit: BoxFit.scaleDown,
                                ),
                        ),
                        Positioned(
                          right: -10,
                          top: -8,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: AppColors.errorBg,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.close, size: 15),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemCount: _currentForm.selectedImagePaths.length,
              ),

            ),
            const CommonDivider(height: 25),

            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CommonInputField(
                    controller: _currentForm.titleController,
                    labelText: 'Product Title',
                    hasLabelPadding: false,
                    hintText: 'e.g. Minimalist Ceramic Mug',
                    labelTrailing: Text('*', style: AppTextStyles.errorText),

                    validator: (String? value) {
                      if (value == 'null') {
                        return 'Title is Required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  CommonInputField(
                    controller: _currentForm.descriptionController,
                    labelText: 'Description',
                    isMultiline: true,
                    maxLines: 3,
                    hintText:
                        "Describe your product's features and benefits...",

                    validator: (String? value) {
                      if (value == 'null') {
                        return 'Description is Required';
                      }
                      return null;
                    },
                  ),

                  const CommonDivider(height: 50),

                  Row(
                    children: [
                      Expanded(
                        child: CommonInputField(
                          labelText: 'Original Price',
                          controller: _currentForm.originalPriceController,
                          leadingIcon: Icon(
                            Icons.attach_money,
                            size: 18,
                            color: AppColors.textHint,
                          ),
                          hintText: '99.99',
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: CommonInputField(
                          labelText: 'Discount %',
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
                    width: 200,
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
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            color: AppColors.primary,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Final Price : \$ ${_currentForm.calculatedFinalPrice}",
                            style: AppTextStyles.headingSmall.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const CommonDivider(height: 50),
                  Text('Category', style: AppTextStyles.labelSmall),
                  const SizedBox(height: 5),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField<String>(
                      initialValue:
                          _currentForm.selectedCategory ??
                          'Select a Product Category',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            value == 'Select Product Category') {
                          return 'Please Select Product Category';
                        }
                        return null;
                      },
                      items: [
                        const DropdownMenuItem<String>(
                          value: 'Select Product Category',
                          child: Text('Select Product Category'),
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
                  Text('Inventory Stock', style: AppTextStyles.labelSmall),
                  const SizedBox(height: 5),
                  NumericStepperButton(
                    onDecrement: () {
                      if (_currentForm.stock > 1) {
                        setState(() {
                          --_currentForm.stock;
                        });
                      }
                    },
                    onIncrement: () {
                      if (_currentForm.stock < 50) {
                        setState(() {
                          ++_currentForm.stock;
                        });
                      }
                    },
                    value: _currentForm.stock,
                    isStyled: true,
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
          label: "Save Product",
          onPressed: () {},
          leadingIcon: Icon(Icons.save, color: AppColors.bgCard),
        ),
      ),
    );
  }
}
