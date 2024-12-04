// import 'package:flutter/material.dart';
//
// ///  Step:1
// ///  ChangeNotifier Class logale he notyfyLisnter use kuribo pare
// class CounterProvider extends ChangeNotifier{
//
//   ///data Managa ki kora hobo aitu karine provider creat kora hoise
//   ///
//   int _counter = 0;
//
//   /// Value Update kora hoise aru
//   void incrementCount(){
//     _counter++;
//
//     ///  Jot update kuribo loga thake tate use kora hoi mane call kora hoi
//     ///  aru itu karone cll kora hoi je Counter Provider value tu r Lisnter ase
//     ///  khaibur Notify hoi jai ba update kuri lobo lage data bur
//     notifyListeners();
//   }
//
//   ///   Value Fetc kora hoise
//   int getCountValue() => _counter;
// }