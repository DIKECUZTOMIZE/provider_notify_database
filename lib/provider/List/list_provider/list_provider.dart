import 'package:flutter/foundation.dart';

class ListProvideFilse extends ChangeNotifier{

  /// Data Handl  List of Map
  /// Get r beleg eta function nobonalio axcess kuribo pare but Privet korar babe
  /// Beleg ke Function bina hoise , mane aie data bur kuneo dierct axcess kuribo
  /// nuare khai karone private kora hoiuse
  ///
   List<Map<String,dynamic>> _mData=[];

   ///  Evenets: Data change korar babe
   void addData(){
     _mData.add({
       'name' : 'sanjit',
       'phonNo'  :'9678844'
     });
     notifyListeners();
   }

   ///  Update:
   void update({required String name ,required String phonNo,required int index}){

    _mData[index]={
      'name' : name,
      'phonNo':phonNo,

    };

     notifyListeners();
   }


   ///  Delet:
    void   delet({required int index}){
     _mData.removeAt(index);

     notifyListeners();
    }


   ///  Fect: Value Reflect:
    List<Map<String,dynamic>> getFect()=>_mData;
}



