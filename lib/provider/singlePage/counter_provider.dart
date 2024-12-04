
import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier{

  int _count=0;

  void incrementCount(){
    _count++;

    notifyListeners();

  }

  void decrementCount(){
    _count--;

    notifyListeners();
  }

  int fectData()=>_count;

}