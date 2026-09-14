import 'package:flutter/widgets.dart';
import 'package:shopflow/core/constants/api_endpoints.dart';
import 'package:shopflow/core/network/api_client.dart';
import 'package:shopflow/features/shop/models/product_model.dart';

class ProductListingProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  List<Category> categoryList = [];
  int? selectedCategoryId;
  bool isLoading = false;


  Future<void> fetchProductsHomeScreen() async {
    notifyListeners();

    try{
      final dynamic response = await ApiClient.getExistingInstance.getRequest(ApiEndpoints.productListingEndpoint(10));
      if (response is List) {
        productList = response.map((item) => ProductModel.fromJson(item)).toList();
      }
    } catch (e) {
      throw Exception('error  ${e.toString()}',);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();

    try{
      final dynamic response = await ApiClient.getExistingInstance.getRequest(ApiEndpoints.categoriesEndpoint);
      if (response is List) {
        categoryList = response.map((item) => Category.fromJson(item)).toList();
      }
    } catch (e) {
      throw Exception('error  ${e.toString()}',);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductsByCategoryId(int id) async {
    isLoading = true;
    notifyListeners();

    try{
      selectedCategoryId = id;
      final dynamic response = await ApiClient.getExistingInstance.getRequest(ApiEndpoints.productByCategoryIdEndpoint(10));
      if (response is List) {
        productList.clear();
        productList = response.map((item) => ProductModel.fromJson(item)).toList();
      }
    } catch (e) {
      throw Exception('error  ${e.toString()}',);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}