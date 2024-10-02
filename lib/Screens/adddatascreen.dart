import 'package:flutter/material.dart';
import 'package:sql_lite_detailed/DataBase/dbhelper.dart';
import 'package:sql_lite_detailed/Model/notemodel.dart';
import 'package:sql_lite_detailed/Screens/notesapp.dart';
import 'package:sql_lite_detailed/widgets/uihelper.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(
              titleController, "Enter Title", "Title", Icons.title),
          const SizedBox(
            height: 10,
          ),
          UiHelper.customTextField(descController, "Enter Description",
              "Description", Icons.description),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: ()async {
                DbHelper().addNotes(
                  NoteModels(
                    desc: descController.text.toString(),
                    title: titleController.text.toString(),
                  ),
                );

                await DbHelper().fetchNotes();
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotesApp() ));
              },
              child: const Text("Add Data"))
        ],
      ),
    );
  }
}
