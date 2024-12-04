import 'package:ane/provider/singlePage/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(ProviderApp());
  // runApp(ChangeNotifierProvider(create: (context) => CounterProvider(),
  //    child:  ProviderApp(),));

}

class ProviderApp   extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ChangeNotifierProvider(create: (context) => CounterProvider(),
          child:ProviderPage1()) ,
    );
  }
}

class ProviderPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Text('${Provider.of<CounterProvider>(context).fectData()}')),

          Center(child: FloatingActionButton(onPressed: (){
            Provider.of<CounterProvider>(context,listen: false).incrementCount();
          },child: Text('Add'),),),

          Center(
            child: FloatingActionButton(onPressed: (){
              Provider.of<CounterProvider>(context,listen: false).decrementCount();
            },child:Text('minus'),),
          )

        ],
      ),
    );
  }
}