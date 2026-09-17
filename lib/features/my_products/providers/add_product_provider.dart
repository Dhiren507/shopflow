import 'package:flutter/foundation.dart';
import 'package:shopflow/core/constants/api_endpoints.dart';
import 'package:shopflow/core/network/api_client.dart';

class AddProductProvider extends ChangeNotifier {
  bool isLoading = false;
  num finalPrice = 0.0;
  int productStock = 1;
  int? selectedCategoryId;
  List<String> selectedImages = [];

  void setFinalPrice(num value) {
    finalPrice = value;
    notifyListeners();
  }

  void setSelectedImages(String value) {
    selectedImages.add(value);
    notifyListeners();
  }

  void removeSelectedImages(int index) {
    selectedImages.removeAt(index);
    notifyListeners();
  }

  void setProductStock(int value) {
    productStock = value;
    notifyListeners();
  }

  void setCategoryId(int? value) {
    selectedCategoryId = value;
    notifyListeners();
  }

  Future<bool> createProduct({
    required String title,
    required num price,
    required String description,
    required int categoryId,
    required List<String> images,
  }) async {
    isLoading = true;

    notifyListeners();

    final Map<String, dynamic> productData = {
      "title": title,
      "price": price,
      "description": description,
      "categoryId": categoryId,
      "images": images,
    };

    try {
      final response = await ApiClient.getExistingInstance.postRequest(
        ApiEndpoints.addProductEndpoint,
        productData,
      );

      if (response != null) {
        print('product response$response');

        selectedImages.clear();
        finalPrice = 0.0;
        productStock = 1;
        selectedCategoryId = null;

        return true;
      } else {
        print('error');
        return false;
      }
    } catch (e) {
      debugPrint('Error : ${e.toString()}');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
