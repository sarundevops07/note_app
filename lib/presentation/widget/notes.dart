// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:note_app/const/action_type.dart';
import 'package:note_app/const/enum.dart';
import 'package:note_app/data/others/api.dart';
import 'package:note_app/presentation/screen/add_edit_note.dart';

class Notes extends StatefulWidget {
  String content;
  String title;
  String id;
  Notes({
    Key? key,
    required this.content,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  // ignore: unused_field
  var _popupMenuItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return AddEditNotes(
              type: ActionType.editNote,
              id: widget.id,
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
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                PopupMenuButton(
                  position: PopupMenuPosition.under,
                  onSelected: (value) => onMenuItemSelected(
                    value as int,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: popUpList(
                        itemName: "Edit",
                        position: Options.edit.index,
                      ),
                    ),
                    PopupMenuItem(
                      child: popUpList(
                        itemName: "delete",
                        position: Options.delete.index,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Text(
                widget.content,
                //maxLines: 7,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popUpList({String? itemName, int? position}) {
    return PopupMenuItem(
      value: position,
      child: Text(itemName ?? ""),
    );
  }

  onMenuItemSelected(var value) {
    setState(() {
      _popupMenuItemIndex = value;
    });
    if (value == Options.edit.index) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return AddEditNotes(
          id: widget.id,
          type: ActionType.editNote,
        );
      }));
      // print("edit");
    } else if (value == Options.delete.index) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure want to delete"),
            content: Text(widget.title),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  NoteDb.instance.deleteNote(widget.id);
                  Navigator.of(context).pop();
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

      //print("delete");
    }
  }
}
