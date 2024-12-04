import 'package:ane/provider/database_provider/dbHelper_provider.dart';
import 'package:ane/provider/database_provider/modaleNote.dart';
import 'package:flutter/material.dart';

class DBProvider extends ChangeNotifier{

  DbHelperProvider dbHelperProvider=DbHelperProvider.getInstance();

  List<NoteModel>_mNote=[];


  /// Event
  /// addNote:   /// addnote Function call kora hoise ,
  void addnote ({required NoteModel note})async{

    /// Boolean mane: Add hoise na nai aitu check kuribo babe bool use kora hoi
    bool check=await  dbHelperProvider.addNote(note);

    if(check){
      ///  dbHelper data baset thoka  note bur olai _mNote tot add kora hoise:
      ///
      _mNote = await dbHelperProvider.fectNote();
      notifyListeners();
    }
  }

  void update({required String title, required String desc,int nId = 0}) async{
    bool check= await dbHelperProvider.updateNote(
        title: DbHelperProvider.NOTE_COLUMN_TITLE,
        desc: DbHelperProvider.NOTE_COLUMN_DESC,
        id:nId);

    if(check){
      _mNote = await dbHelperProvider.fectNote();
      notifyListeners();
    }

  }

  void delet({required int nId})async{

  bool check = await dbHelperProvider.deletNote(deletID: nId);
  if(check){
    _mNote = await dbHelperProvider.fectNote();
    notifyListeners();
  }
  }

  /// listen kora hoise
  List<NoteModel> getAllNotes()=>_mNote;


  /// initatate show kuribir babe ,judi value change kora hoise
  /// value change kora hoise aru i value long timer babe dekhabor babe kam
  void getInitialNotes()async{
    _mNote=await dbHelperProvider.fectNote();

    notifyListeners();
  }
}