import 'package:provider_database/provider2//listProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Tow'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Provider.of<ListProvider>(context,listen: false).addData();
          /// List provider filst jabo karon tate data operation kora hobo
          // mData.add({
          //   'name' :'Raman',
          //   'MobileNO':'9678844797'
          // });
          //

        }, child: Text('Add')),
      ),
    );
  }
}