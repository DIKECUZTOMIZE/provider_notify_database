import 'package:ane/provider/multipleWidget/multiplePageCounterProvider.dart';
import 'package:ane/provider/multipleWidget/multipleSeconPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(create:(context) => MultipleCountProvider()
      ,child: MultipleProviderApp()));
}

class MultipleProviderApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProviderPage1(),
      // home:ChangeNotifierProvider( create: (context) => MultiplePageCountProvider(),
      //
      //     child:ProviderPage1()) ,
    );
  }
}

class ProviderPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Text('Page One'),
      ),


      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

            Text('${Provider.of<MultipleCountProvider>(context).FectLisnter()}'),

          Center(child: FloatingActionButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => ProviderPage2(),));
          },child: Text('Next'),),),
        ],
      )


    );
  }
}