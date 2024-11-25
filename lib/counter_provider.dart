import 'package:flutter/cupertino.dart';


/// notifier class extend kora pasot pura provider class hoi jabo
/// changNotified r karone kam ata hei ,
///notifier function class instner adha adha kuribo lagibo karon jot  jot call  kora hobo
class CounterProvider extends ChangeNotifier{

  /// Data: Manage kuribo lage data
  /// privat kora hoise karon iar classor pora belegot use hobo nuare
  /// ai counter varible tu main pager poea othai ani aite manga kora hoi counter tu
  int _counter = 0;

  /// incremnet korar babe  function
  /// value update kora hoise
  void incremnetCount(){
    _counter++;

    /// ai function tu use kora hoise je jot jot chang kora hobo tate ai function tu use kora hobo:
    /// jiman ai valuer listner ase khai bur notify hoi jai  mane value chamge hoi gl atia  tnte update hoi jabo lagibo
    /// aru reblite hoi jabo lagibo,
    /// data changr huar pasot rebilt  hoijabo lage
    notifyListeners();
  }

  /// value fect kora hoise :
  int getcountValue(){
    return _counter;
  }

}