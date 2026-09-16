import 'package:flutter/widgets.dart';
import 'package:shopflow/core/constants/api_endpoints.dart';
import 'package:shopflow/core/network/api_client.dart';
import 'package:shopflow/features/shop/models/product_model.dart';

class ProductDetailProvider extends ChangeNotifier {
  ProductModel? selectedProduct;
  int selectedImageIndex = 1;
  bool isReviewListExpanded = false;
  bool isLoading = false;

  void setImageIndex(int value) {
    selectedImageIndex = value;
    notifyListeners();
  }

  void setReviewListExpanded(bool value){
    isReviewListExpanded = value;
    notifyListeners();
  }

  void setProductQuantity(int value) {
    selectedProduct?.productQuantity = value;
    notifyListeners();
  }

  Future<void> fetchProductDetail(int id) async {
    isLoading = true;
    notifyListeners();

    try{
      final response = await ApiClient.getExistingInstance.getRequest(ApiEndpoints.getProductDetailEndpoint(id));
       if(response != null) {
         selectedProduct = ProductModel.fromJson(response);
       }
    } catch (e) {
      throw Exception('error  ${e.toString()}',);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}