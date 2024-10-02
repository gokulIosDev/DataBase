
import 'package:sql_lite_detailed/DataBase/dbhelper.dart';

class NoteModels {
  int? noteid;
  String title;
  String desc;

  NoteModels({required this.desc, required this.title, this.noteid});

  factory NoteModels.fromMap(Map<String, dynamic> mapdata) {
    return NoteModels(
        desc: mapdata[DbHelper.db.columnDescription],
        title: mapdata[DbHelper.db.columnTitle],
        noteid: mapdata[DbHelper.db.columnId]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.db.columnTitle: title,
      DbHelper.db.columnDescription: desc,
      DbHelper.db.columnId: noteid
    };
  }
}
