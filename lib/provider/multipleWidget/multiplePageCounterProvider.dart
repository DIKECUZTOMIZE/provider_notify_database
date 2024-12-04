import 'package:flutter/foundation.dart';

class MultipleCountProvider extends ChangeNotifier{

  int _count=0;
  void incremnetCount(){

    _count++;
    notifyListeners();
  }

  int FectLisnter()=>_count;
}