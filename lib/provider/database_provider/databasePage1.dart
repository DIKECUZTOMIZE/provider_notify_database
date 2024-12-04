import 'package:ane/provider/database_provider/databaseProvider.dart';
import 'package:ane/provider/database_provider/dbHelper_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


class DatabasePage1 extends StatelessWidget {

  DatabasePage1({required bool is = false})

 static var titleController = TextEditingController();
 static var descController = TextEditingController();

  DbHelperProvider dbHelperProvider = DbHelperProvider.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30),
      child:getUpdateAddNotes()
    ));
  }


 static  Widget getUpdateAddNotes(){
   return  SizedBox(
       width: double.infinity,

       child: Column(children: [

         Center(
             child: Text( ?'Update':'Add Note',
               style: TextStyle(fontSize: 30),
             )),

         SizedBox(
           height: 11,
         ),

         TextField(
           controller: titleController,
         ),

         SizedBox(
           height: 11,
         ),

         TextField(
           controller: descController,
         ),

         SizedBox(
           height: 11,
         ),

         Row(
           children: [
             OutlinedButton(
                 onPressed: ()async{
                   if (titleController.text.isNotEmpty &&
                       descController.text.isNotEmpty) {

                     bool check=false;

                     if(isUpadte){
                        check= context.read<DBProvider>().update
                     }
                     else{
                       check= context.read<DBProvider>
                       Navigator.pop(context);
                     }
                      if(check){
                        Navigator.pop(context);
                      }

                   }
                 },
                 child: Text(isUpadte ? 'Update':'Add')),

             SizedBox(
               width: 11,
             ),



             OutlinedButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: Text('Cancel')),
           ],
         )
       ]));
  }

}

