import 'package:ane/provider/List/list_provider/list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage1   extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page1'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){


          /// Notifyres

          context.read<ListProvideFilse>().addData();
          // Provider.of<ListProvideFilse>(context,listen: false).addData();
        }, child: Text('Add')),
      ),

    );
  }
}