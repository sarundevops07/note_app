part of 'note_app_bloc.dart';

@freezed
class NoteAppEvent with _$NoteAppEvent {
  const factory NoteAppEvent.createNote({required NoteModel value}) =
      CreateNote;
  const factory NoteAppEvent.getAllNotes() = GetAllNotes;
  const factory NoteAppEvent.updateNote({required NoteModel value}) =
      UpdateNote;
}
