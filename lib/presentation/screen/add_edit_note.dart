// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:note_app/const/action_type.dart';
import 'package:note_app/data/model/notes_model/note_model.dart';
import 'package:note_app/data/others/api.dart';

class AddEditNotes extends StatelessWidget {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final ActionType type;
  String? id;
  AddEditNotes({Key? key, required this.type, this.id}) : super(key: key);
  final sacffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (type == ActionType.editNote) {
      if (id == null) {
        Navigator.pop(context);
      }
      final note = NoteDb.instance.getNoteById(id!);
      if (note == null) {
        Navigator.pop(context);
      }
      titleController.text = note!.title ?? "no title";
      contentController.text = note.content ?? "no content";
    }
    return Scaffold(
      key: sacffoldKey,
      appBar: AppBar(
        title: Text(type.name.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              maxLines: 1,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: "title",
                hintTextDirection: TextDirection.ltr,
                hintStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: contentController,
              maxLines: 5,
              maxLength: 100,
              decoration: const InputDecoration(
                hintText: "Content",
                hintTextDirection: TextDirection.ltr,
                hintStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                switch (type) {
                  case ActionType.addNote:
                    saveButton(context);
                    // Add Note
                    break;
                  case ActionType.editNote:
                    editButton(context);
                    // Edit Note
                    break;
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveButton(BuildContext ctx) async {
    String title = titleController.text;
    String content = contentController.text;
    final newNote = NoteModel.create(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        content: content);
    final savedNote = await NoteDb().createNote(newNote);
    savedNote != null ? Navigator.pop(ctx) : print("Notes not saved");
    NoteDb.instance.getAllNotes();
  }

  Future<void> editButton(BuildContext ctx) async {
    final title = titleController.text;
    final content = contentController.text;
    final editedNote = NoteModel.create(id: id, title: title, content: content);
    NoteDb.instance.updateNote(editedNote);
    Navigator.pop(ctx);
    NoteDb.instance.getAllNotes();
  }
}
