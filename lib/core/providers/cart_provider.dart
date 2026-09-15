import 'package:flutter/cupertino.dart';
import 'package:shopflow/features/shop/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cartItems = [];

  void addProduct(ProductModel newProduct){
    cartItems.add(newProduct);
    notifyListeners();
  }

  void removeProduct(int index){
    cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseProductQuantity(int index) {
    cartItems[index].productQuantity = cartItems[index].productQuantity! + 1;
    notifyListeners();
  }

  void decreaseProductQuantity(int index) {
    cartItems[index].productQuantity = cartItems[index].productQuantity! - 1;
    notifyListeners();
  }
}