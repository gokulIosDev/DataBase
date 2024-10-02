import 'package:flutter/material.dart';
import 'package:sql_lite_detailed/DataBase/dbhelper.dart';
import 'package:sql_lite_detailed/Model/notemodel.dart';
import 'package:sql_lite_detailed/Screens/adddatascreen.dart';
import 'package:sql_lite_detailed/widgets/uihelper.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  late DbHelper dbHelper;
  List<NoteModels> arrNotes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbHelper.db;
    fetchNotes();
  }

  fetchNotes() async {
    arrNotes = await dbHelper.fetchNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDataScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile(
          title: Text(arrNotes[index].title),
          subtitle: Text(arrNotes[index].desc),
          trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red,)),
        );
      },itemCount: arrNotes.length,),
    );
  }
}
