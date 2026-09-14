import 'package:flutter/widgets.dart';
import 'package:shopflow/core/constants/api_endpoints.dart';
import 'package:shopflow/core/network/api_client.dart';
import 'package:shopflow/features/shop/models/product_model.dart';

class ProductDetailProvider extends ChangeNotifier {
  ProductModel? selectedProduct;
  bool isLoading = false;

  Future<void> fetchProductDetail(int id) async {
    isLoading = true;
    notifyListeners();

    try{
      final dynamic response = await ApiClient.getExistingInstance.getRequest(ApiEndpoints.getProductDetailEndpoint(id));
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