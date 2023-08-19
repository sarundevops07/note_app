// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:note_app/const/action_type.dart';
import 'package:note_app/data/model/notes_model/note_model.dart';
import 'package:note_app/data/others/api.dart';
import 'package:note_app/presentation/screen/add_edit_note.dart';
import 'package:note_app/presentation/widget/notes.dart';

class NoteAppHome extends StatelessWidget {
  const NoteAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NoteDb.instance.getAllNotes();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Note App",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddEditNotes(
                  type: ActionType.addNote,
                );
              }));
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: NoteDb.instance.noteListNotifier,
          builder: (context, List<NoteModel> newNotes, _) {
            if (newNotes.isEmpty) {
              return const Center(
                child: Text('Your notepad is empty.'),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: List.generate(
                newNotes.length,
                (index) {
                  final note = NoteDb.instance.noteListNotifier.value[index];
                  if (note.id == null) {
                    return const SizedBox();
                  }
                  return Notes(
                    id: note.id!,
                    title: note.title ?? 'No title.',
                    content: note.content ?? 'No content.',
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
