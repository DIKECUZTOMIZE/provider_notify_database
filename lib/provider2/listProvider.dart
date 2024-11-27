import 'package:flutter/material.dart';

class ListProvider extends  ChangeNotifier{

  /// Data:Handl:
  List<Map<String,dynamic>> _mData= [];

  /// Event:

  void addData(){

    _mData.add({
    'name' :'Raman',
    'mobileNo':'9678844797',
    });
    notifyListeners();
  }


  List<Map<String,dynamic>> getData ()=>_mData;


}
