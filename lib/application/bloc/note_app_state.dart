part of 'note_app_bloc.dart';

@freezed
class NoteAppState with _$NoteAppState {
  const factory NoteAppState({
    required bool isError,
    required List<NoteModel> notes,
  }) = _Initial;
  factory NoteAppState.initial() =>
      const NoteAppState(isError: false, notes: []);
}
