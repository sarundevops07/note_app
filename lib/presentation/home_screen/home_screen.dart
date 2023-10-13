import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/bloc/note_app_bloc.dart';
import 'package:note_app/const/action_type.dart';
import 'package:note_app/presentation/add_edit_screen/add_edit_screen.dart';
import 'package:note_app/presentation/home_screen/notes.dart';

class NoteAppHome extends StatelessWidget {
  const NoteAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoteAppBloc>().add(const NoteAppEvent.getAllNotes());
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
        body: SafeArea(child: BlocBuilder<NoteAppBloc, NoteAppState>(
          builder: (context, state) {
            if (state.isError) {
              return const Center(
                child: Text("Error occured"),
              );
            } else if (state.notes.isEmpty) {
              return const Center(
                child: Text("Notes are Empty"),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: List.generate(
                state.notes.length,
                (index) {
                  final dataOfNotes = state.notes[index];
                  return Notes(
                    title: dataOfNotes.title,
                    content: dataOfNotes.content,
                    id: dataOfNotes.id,
                    notes: dataOfNotes,
                  );
                },
              ),
            );
          },
        )));
  }
}
