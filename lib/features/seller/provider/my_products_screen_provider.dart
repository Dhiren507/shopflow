import 'package:flutter/cupertino.dart';

class MyProductsScreenProvider extends ChangeNotifier{
  int currentTabIndex = 0;

  void setCurrentTabIndex(int value){
    currentTabIndex = value;
    notifyListeners();
  }
}