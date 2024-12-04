
import 'package:ane/provider/database_provider/databasePage1.dart';
import 'package:ane/provider/database_provider/databaseProvider.dart';
import 'package:ane/provider/database_provider/dbHelper_provider.dart';
import 'package:ane/provider/database_provider/modaleNote.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



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
    /// read value chane
    context.read<DBProvider>().getInitialNotes();
    //  getNotes();
  }

  // void getNotes()async{
  //   myData=await  dbHelperProvider.fectNote();
  //   setState(() {});
  // }
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
          title: Text(myData[index].title),
          subtitle: Text(myData[index].desc),
          trailing: SizedBox(
            width: 70,
            child: Row(
              children: [

                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => DatabasePage1(isupdate: true,),));
                  },
                  child: Icon(Icons.edit),
                ),


                InkWell(
                  onTap: () async{
                 //   bool chek = await dbHelperProvider.deletNote(deletID: myData[index].id!);

                    context.read<DBProvider>().delet(nId:myData[index].id!);
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
              MaterialPageRoute(
                builder: (context) => DatabasePage1(isupdate: false,),
              ));
        },
        child: Text('next '),
      ),
    );
  }
}