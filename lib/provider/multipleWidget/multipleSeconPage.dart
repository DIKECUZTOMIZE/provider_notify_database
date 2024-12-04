import 'package:ane/provider/multipleWidget/multiplePageCounterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage2  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(child: FloatingActionButton(onPressed: (){

        Provider.of<MultipleCountProvider>(context,listen: false).incremnetCount();
      },child: Text('Add'),)),
    );
  }
}