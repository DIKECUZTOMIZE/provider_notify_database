 import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider_database/provider/database_provider/modaleNote.dart';
import 'package:sqflite/sqflite.dart';


class DbHelperProvider {

   DbHelperProvider._(){}

   static DbHelperProvider getInstance(){
     return DbHelperProvider._();
   }

   Database ? mData;

   static const NOTE_TABLE='n_table';
   static const NOTE_COLUMN_ID='n_id';
   static const NOTE_COLUMN_TITLE='n_title';
   static const NOTE_COLUMN_DESC='n_desc';

   Future<Database>initDB()async{

      mData=mData ?? await openDB();
      return mData!;
   }

   Future<Database>openDB()async{

     var dirPath=await getApplicationDocumentsDirectory();
     var dbPath=join(dirPath.path,'noteDb.db');
     return openDatabase(dbPath,version: 1,onCreate: (db, version) {
       db.execute('create table $NOTE_TABLE ( $NOTE_COLUMN_ID integer primary key autoincrement, $NOTE_COLUMN_TITLE text, $NOTE_COLUMN_DESC text)');
     },);
   }

   Future<bool>addNote(NoteModel newNote)async{

     Database db= await initDB();
     int rowsEffected = await db.insert(NOTE_TABLE,newNote.toMap());

     return rowsEffected >0;
   }
   Future<List<NoteModel>> fectNote ()async{
     Database db=await initDB();
     List<Map<String ,dynamic>> allNote =await db.query(NOTE_TABLE);

     List<NoteModel>mNote=[];
     for(Map<String,dynamic> eacData in allNote){
       NoteModel eaceNote=NoteModel.fromMap(eacData);
       mNote.add(eaceNote);
     }
     return mNote;
   }

   Future<bool>updateNote({required String titleD ,required String descD,required int updateIdD})async{
     Database db = await initDB();

     int rowsEffected = await db.update(NOTE_TABLE, {

       NOTE_COLUMN_TITLE:titleD,
       NOTE_COLUMN_DESC:descD
     },where: '$NOTE_COLUMN_ID =?',whereArgs: ['$updateIdD']);
     return rowsEffected > 0;
   }


  Future<bool>deletNote({required int deletIdD})async{
     Database db = await initDB();
     int rowsEffected= await db.delete(NOTE_TABLE,
     where: "$NOTE_COLUMN_ID=?", whereArgs:['$deletIdD'] );
     return rowsEffected > 0;
  }
}