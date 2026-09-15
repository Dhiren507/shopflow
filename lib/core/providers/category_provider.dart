import 'package:flutter/foundation.dart' hide Category;
import 'package:shopflow/core/constants/api_endpoints.dart';
import 'package:shopflow/core/network/api_client.dart';
import 'package:shopflow/features/shop/models/product_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categoryList = [];
  bool isLoading = false;

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final dynamic response = await ApiClient.getExistingInstance.getRequest(
        ApiEndpoints.categoriesEndpoint,
      );
      categoryList = (response as List)
          .map((item) => Category.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('error  ${e.toString()}');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}