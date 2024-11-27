import 'package:provider_database/provider2//listPage.dart';
import 'package:provider_database/provider2/page1.dart';
import 'package:provider_database/provider2/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'listProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) =>  ListProvider(),
      child: ChangeNotifierProvider(create: (context) => ProviderFilse(),
      child: MyApp(),)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('${Provider.of<ProviderFilse>(context,listen: true).getfectProvider()}'),
          ),

          SizedBox(
            height: 11,
          ),

          FloatingActionButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => Page1(),));

          },child: Text('next Page'),)
        ],
      ),

    );
  }
}


