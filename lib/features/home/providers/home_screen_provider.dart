import 'package:flutter/widgets.dart';
import 'package:shopflow/core/constants/api_endpoints.dart';
import 'package:shopflow/core/network/api_client.dart';
import 'package:shopflow/features/home/models/product_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  int? selectedCategoryId;
  int limit = 10;
  bool isLoading = false;
  bool isLoadingMoreProducts = false;
  bool hasMoreData = true;

  void toggleProductLike(int index) {
    productList[index].isLiked = productList[index].isLiked == true
        ? false
        : true;
    notifyListeners();
  }

  Future<void> fetchProductsHomeScreen({
    int? categoryId,
    isRefresh = false,
    isAll = false,
  }) async {
    if (categoryId != null || isRefresh || isAll) {
      selectedCategoryId = isAll ? null : (categoryId ?? selectedCategoryId);
      productList.clear();
      isLoading = false;
      isLoadingMoreProducts = false;
      hasMoreData = true;
    }

    if (isLoading || isLoadingMoreProducts || !hasMoreData) return;

    if (productList.isEmpty) {
      isLoading = true;
    } else {
      isLoadingMoreProducts = true;
    }
    notifyListeners();

    int currentOffset = productList.length;

    try {
      final response = await ApiClient.getExistingInstance.getRequest(
        selectedCategoryId != null
            ? ApiEndpoints.productListingEndpoint(
                limit,
                offset: currentOffset,
                categoryId: selectedCategoryId.toString(),
              )
            : ApiEndpoints.productListingEndpoint(limit, offset: currentOffset),
      );

      final List<ProductModel> newFetchedProducts = (response as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();

      productList.addAll(newFetchedProducts);

      if (newFetchedProducts.length < limit) {
        hasMoreData = false;
      }
    } catch (e) {
      throw Exception('error  ${e.toString()}');
    } finally {
      isLoading = false;
      isLoadingMoreProducts = false;
      notifyListeners();
    }
  }
}
