import 'package:flutter/material.dart';

class ProductFormModel {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final originalPriceController = TextEditingController();
  final discountController = TextEditingController();

  List<String> selectedImagePaths = [];


  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    originalPriceController.dispose();
    discountController.dispose();
  }
}
