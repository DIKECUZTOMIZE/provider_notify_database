 import 'package:provider_database/provider/database_provider/dbHelper_provider.dart';

class NoteModel{

  int?  idM;
  String titleM;
  String descM;

  NoteModel({
    this.idM,
    required this.titleM,
    required this.descM,
});
  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(
      idM: map[DbHelperProvider.NOTE_COLUMN_ID],
      titleM: map[DbHelperProvider.NOTE_COLUMN_TITLE],
      descM: map[DbHelperProvider.NOTE_COLUMN_DESC]

    );
  }

  Map<String,dynamic>toMap()=>
      { DbHelperProvider.NOTE_COLUMN_TITLE:titleM,
       DbHelperProvider.NOTE_COLUMN_DESC:descM,
     };


}