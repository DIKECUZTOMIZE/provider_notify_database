import 'package:flutter/cupertino.dart';

class ProviderFilse extends ChangeNotifier {

  int _count=0;
  void incrementProvider(){
    _count++;
    notifyListeners();
  }

  int getfectProvider(){
   return _count;

  }
}