import 'package:flutter/material.dart';

class ProductFormModel {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final originalPriceController = TextEditingController();
  final discountController = TextEditingController();


  List<String> selectedImagePaths = ['', '', '', ''];
  String? selectedCategory = 'Beauty';
  num calculatedFinalPrice = 0;
  int stock = 1;


  void calculateFinalPrice() {
    double original = double.tryParse(originalPriceController.text) ?? 0.0;
    double discount = double.tryParse(discountController.text) ?? 0.0;

    if (original > 0) {
      calculatedFinalPrice = original - (original * (discount / 100));
    } else {
      calculatedFinalPrice = 0;
    }
  }

  Map<String, dynamic> toBackendJson() {
    return {
      'imagePaths': selectedImagePaths,
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'finalPrice': calculatedFinalPrice,
      'category': selectedCategory ?? 'General',
      'stock': stock,
    };
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    originalPriceController.dispose();
    discountController.dispose();
  }
}
