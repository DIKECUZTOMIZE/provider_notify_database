import 'package:provider_database/provider2//listProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page2.dart';

/// pakage hoi gl List aru map
 //List<Map<String,dynamic>> mData=[]; /// singl page handal kora hobo


class ListPage extends StatefulWidget{
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  /// classr pora bahirot loi jua hoise list map karon globa bonaboloi
// static List<Map<String,dynamic>> mData=[];

  @override
  Widget build(BuildContext context) {

    ///  Show kuribor babe mData (getData)fects
    var mData = Provider.of<ListProvider>(context).getData();

    return Scaffold(
       appBar: AppBar(
         centerTitle:  true,
         title: Text('List Page'),
       ),
       body:ListView.builder(
         itemCount: mData.length,
         itemBuilder: (context, index) =>
             ListTile(
               title:Text(mData[index]['name']) ,
               subtitle:Text(mData[index]['mobileNo'].toString()) ,
             ),),

       floatingActionButton: FloatingActionButton(onPressed: (){
        
        /// anekoi o data show kuribo pare direct button map functipn logai
         // mData.add({
         //   'name' : 'Raman',
         //   'mobileNo':'9678844797'
         //
         // });
         
         Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(),));
         


       },child: Text('Add'))
     );
  }
}