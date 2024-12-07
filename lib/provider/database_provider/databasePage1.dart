import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/provider/database_provider/databaseProvider.dart';
import 'package:provider_database/provider/database_provider/dbHelper_provider.dart';
import 'package:provider_database/provider/database_provider/modaleNote.dart';

class DatabasePage1 extends StatelessWidget {
  bool isUpdateAndAdd;
  int? id1;
  String title1;
  String desc1;

  DatabasePage1(
      {this.isUpdateAndAdd = false,
      this.id1,
      this.title1 = '',
      this.desc1 = ''});

  var titleController = TextEditingController();
  var descController = TextEditingController();

  DbHelperProvider dbHelperProvider = DbHelperProvider.getInstance();

  @override
  Widget build(BuildContext context) {

    titleController.text = title1;
    descController.text = desc1;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(21),
            child: Column(children: [
              Center(
                  child: Text(
                isUpdateAndAdd ? 'Update' : 'Add Note',
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
                      onPressed: () async {
                        if (titleController.text.isNotEmpty &&
                            descController.text.isNotEmpty) {

                          if (isUpdateAndAdd) {
                            context.read<DBProvider>().update(
                                titleP: titleController.text,
                                descP: descController.text,
                                nIdP: id1!);
                          } else {
                            context.read<DBProvider>().addnote(
                                note: NoteModel(
                                    titleM: titleController.text,
                                    descM: descController.text));
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: Text(isUpdateAndAdd ? 'Update' : 'Add')),
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
            ])));
  }
}
