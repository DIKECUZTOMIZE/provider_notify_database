import 'package:flutter/material.dart';
import 'package:provider_database/provider/database_provider/dbHelper_provider.dart';
import 'package:provider_database/provider/database_provider/modaleNote.dart';

class DBProvider extends ChangeNotifier{

  DbHelperProvider dbHelperProvider=DbHelperProvider.getInstance();

  List<NoteModel>_mNote=[];
  void addnote ({required NoteModel note})async{

    bool check=await  dbHelperProvider.addNote(note);

    if(check){
      _mNote = await dbHelperProvider.fectNote();
      notifyListeners();
    }
  }

  void update({required String titleP, required String descP,required int nIdP }) async{
    bool check= await dbHelperProvider.updateNote(
        titleD: titleP,
        descD: descP,
        updateIdD:nIdP);

    if(check){
      _mNote = await dbHelperProvider.fectNote();
      notifyListeners();
    }
  }

  void delet({required int nId})async{

  bool check = await dbHelperProvider.deletNote(deletIdD: nId);
  if(check){
    _mNote = await dbHelperProvider.fectNote();
    notifyListeners();
  }
  }

  List<NoteModel> getAllNotes()=>_mNote;

  void getInitialNotes()async{
    _mNote=await dbHelperProvider.fectNote();

    notifyListeners();
  }
}