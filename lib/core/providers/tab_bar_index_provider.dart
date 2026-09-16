import 'package:flutter/cupertino.dart';

class TabBarIndexProvider extends ChangeNotifier{
  int currentTabIndex = 0;

  void setCurrentTabIndex(int value){
    currentTabIndex = value;
    notifyListeners();
  }

}