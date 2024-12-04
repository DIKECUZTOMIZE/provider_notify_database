import 'package:ane/provider/database_provider/dbHelper_provider.dart';

class NoteModel{

  int?  id;
  String title;
  String desc;

  NoteModel({
    this.id,
    required this.title,
    required this.desc,
});
  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(
      id: map[DbHelperProvider.NOTE_COLUMN_ID],
      title: map[DbHelperProvider.NOTE_COLUMN_TITLE],
      desc: map[DbHelperProvider.NOTE_COLUMN_DESC]

    );
  }


  ///
  Map<String,dynamic>toMap()=>
      { DbHelperProvider.NOTE_COLUMN_TITLE:title,
       DbHelperProvider.NOTE_COLUMN_DESC:desc,
     };


}