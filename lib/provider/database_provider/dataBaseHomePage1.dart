
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/provider/database_provider/databasePage1.dart';
import 'package:provider_database/provider/database_provider/databaseProvider.dart';
import 'package:provider_database/provider/database_provider/modaleNote.dart';

import 'dbHelper_provider.dart';



class DatabaseProviderPage1 extends StatefulWidget {
  @override
  State<DatabaseProviderPage1> createState() => _DatabaseProviderPage1State();
}

class _DatabaseProviderPage1State extends State<DatabaseProviderPage1> {

  DbHelperProvider dbHelperProvider = DbHelperProvider.getInstance();

  List<NoteModel> myData = [];

  @override
  void initState() {
    super.initState();
    context.read<DBProvider>().getInitialNotes();
  }


  @override
  Widget build(BuildContext context) {
    myData = context.watch<DBProvider>().getAllNotes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Base Provider Page1'),
      ),
      body: myData.isNotEmpty
          ? ListView.builder(
        itemCount: myData.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(myData[index].titleM),
          subtitle: Text(myData[index].descM),
          trailing: SizedBox(
            width: 70,
            child: Row(
              children: [

                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => DatabasePage1(
                     isUpdateAndAdd: true,
                      id1: myData[index].idM,
                     title1: myData[index].titleM,
                     desc1: myData[index].descM,

                   ),));
                  },
                  child: Icon(Icons.edit),
                ),


                InkWell(
                  onTap: () async{
                       context.read<DBProvider>().delet(nId:myData[index].idM!);


                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
          : Center(child: Text('Note not yet ')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>DatabasePage1()));
        },
        child: Text('next '),
      ),
    );
  }
}