import 'package:provider_database/provider2//provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Page1'),
      ),

      body: Center(
        child: ElevatedButton(onPressed: (){
          Provider.of<ProviderFilse>(context,listen: false).incrementProvider();

        }, child: Icon(Icons.add)),
      ),
    );
  }
}