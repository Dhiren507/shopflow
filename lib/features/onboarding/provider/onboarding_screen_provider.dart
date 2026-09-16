import 'package:flutter/cupertino.dart';

class OnboardingScreenProvider extends ChangeNotifier{
  int currentImageIndex = 0;

  void setCurrentImageIndex(int value){
    currentImageIndex = value;
    notifyListeners();
  }
}