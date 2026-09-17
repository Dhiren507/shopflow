import 'package:flutter/cupertino.dart';
import 'package:shopflow/core/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cartItems = [];

  bool addProduct(ProductModel newProduct) {
    final int existingIndex = cartItems.indexWhere(
      (item) => item.id == newProduct.id,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex].productQuantity =
          (cartItems[existingIndex].productQuantity ?? 1) + 1;
      notifyListeners();
      return false;
    } else {
      newProduct.productQuantity = newProduct.productQuantity ?? 1;
      cartItems.add(newProduct);
      notifyListeners();
      return true;
    }
  }

  void removeProduct(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseProductQuantity(int index) {
    cartItems[index].productQuantity =
        (cartItems[index].productQuantity ?? 1) + 1;
    notifyListeners();
  }

  void decreaseProductQuantity(int index) {
    cartItems[index].productQuantity =
        (cartItems[index].productQuantity ?? 1) - 1;
    notifyListeners();
  }
}
