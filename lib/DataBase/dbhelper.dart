import 'dart:developer';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_lite_detailed/DataBase/temp.dart';
import 'package:sql_lite_detailed/Model/notemodel.dart';
import 'package:sql_lite_detailed/Screens/notesapp.dart';

class DbHelper {
  static final DbHelper db = DbHelper(); // Singleton Class
  Database? _database;
  var tableName = "note";
  var columnId = "note_Id";
  var columnTitle = "Note_title";
  var columnDescription = "Note_Description";

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    var directory =
        await getApplicationDocumentsDirectory(); // this is help to create the empty path for dataBase creation
    await directory.create(
        recursive:
            true); //this is help to avoid create the new dataBase while we add the new data
    var path = directory.path + "notesdb.db";
    return await openDatabase(path, version: 1,onCreate: (db,version){ // version 1 means latest version
      db.execute("create table $tableName ($columnId integer primary key autoincrement, $columnTitle text, $columnDescription text)");
    });
  }

  Future<bool> addNotes(NoteModels newModel) async {
    var db = await getDb();
    int rowEffected = await db.insert(tableName, newModel.toMap());
    log(rowEffected.toString());
    return rowEffected > 0;
  }

  Future<List<NoteModels>> fetchNotes()async {
    var db = await getDb();
    List<Map<String,dynamic>> notes = await db.query(tableName);
    List<NoteModels>listNotes = [];
    for(Map<String,dynamic>noteModel in notes){
      NoteModels getNotes = NoteModels.fromMap(noteModel);
      listNotes.add(getNotes);
    }
    return listNotes;
}


  // add(String titles,String descri)async {
  //   var db = await getDb();
  //   db.insert(tableName, {
  //     columnTitle : titles,
  //     columnDescription : descri
  //   });
  // }
}
