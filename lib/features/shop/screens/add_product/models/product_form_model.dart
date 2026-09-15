import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_strings.dart';

class ProductFormModel {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final originalPriceController = TextEditingController();
  final discountController = TextEditingController();

  List<String> selectedImagePaths = [];
  String? selectedCategory = AppStrings.selectCategoryHint;


  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    originalPriceController.dispose();
    discountController.dispose();
  }
}
