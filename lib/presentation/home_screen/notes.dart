import 'package:flutter/material.dart';
import 'package:note_app/application/bloc/note_app_bloc.dart';
import 'package:note_app/const/action_type.dart';
import 'package:note_app/const/enum.dart';
import 'package:note_app/domain/model/notes_model/note_model.dart';
import 'package:note_app/infrastructure/home_screen/i_home_screen_repository.dart';
import 'package:note_app/presentation/add_edit_screen/add_edit_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notes extends StatelessWidget {
  final String? content;
  final String? title;
  final String? id;
  final NoteModel? notes;

  const Notes(
      {Key? key,
      required this.content,
      required this.title,
      required this.id,
      required this.notes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return AddEditNotes(
              type: ActionType.editNote,
              id: id,
              notes: notes,
            );
          },
        ),
      ),
      child: Container(
        color: Colors.amber,
        height: 10,
        width: 10,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                PopupMenuButton<int>(
                  position: PopupMenuPosition.under,
                  onSelected: (value) => onMenuItemSelected(
                    context,
                    value,
                    id!,
                  ),
                  itemBuilder: (context) => [
                    popUpList(
                      itemName: "Edit",
                      position: Options.edit.index,
                    ),
                    popUpList(
                      itemName: "delete",
                      position: Options.delete.index,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Text(
                content!,
                //maxLines: 7,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<int> popUpList({String? itemName, int? position}) {
    return PopupMenuItem<int>(
      value: position,
      child: Text(itemName ?? ""),
    );
  }

  void onMenuItemSelected(BuildContext context, int value, String id) {
    if (value == Options.edit.index) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return AddEditNotes(
              notes: notes,
              id: id,
              type: ActionType.editNote,
            );
          },
        ),
      );
    } else if (value == Options.delete.index) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure want to delete"),
            content: Text(title!),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  NoteRepository().deleteNote(id);
                  Navigator.of(context).pop();
                  context
                      .read<NoteAppBloc>()
                      .add(const NoteAppEvent.getAllNotes());
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
