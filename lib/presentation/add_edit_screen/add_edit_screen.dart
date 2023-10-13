import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/bloc/note_app_bloc.dart';
import 'package:note_app/const/action_type.dart';
import 'package:note_app/domain/model/notes_model/note_model.dart';

class AddEditNotes extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final ActionType type;
  final String? id;
  final NoteModel? notes;

  AddEditNotes({
    Key? key,
    required this.type,
    this.id,
    this.notes,
  })  : titleController = TextEditingController(text: notes?.title ?? ""),
        contentController = TextEditingController(text: notes?.content ?? ""),
        super(key: key);
  final sacffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoteAppBloc>().add(const NoteAppEvent.getAllNotes());
    });

    return BlocBuilder<NoteAppBloc, NoteAppState>(
      builder: (context, state) {
        if (type == ActionType.editNote) {
          if (id == null) {
            Navigator.pop(context);
          }
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
      },
    );
  }

  Future<void> saveButton(BuildContext ctx) async {
    String title = titleController.text;
    String content = contentController.text;
    final newNote = NoteModel.create(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        content: content);
    ctx.read<NoteAppBloc>().add(NoteAppEvent.createNote(value: newNote));
    Navigator.pop(ctx);
    ctx.read<NoteAppBloc>().add(const NoteAppEvent.getAllNotes());
  }

  Future<void> editButton(BuildContext ctx) async {
    final title = titleController.text;
    final content = contentController.text;
    final editedNote = NoteModel.create(id: id, title: title, content: content);
    ctx.read<NoteAppBloc>().add(NoteAppEvent.updateNote(value: editedNote));
    Navigator.pop(ctx);
    ctx.read<NoteAppBloc>().add(const NoteAppEvent.getAllNotes());
  }
}
