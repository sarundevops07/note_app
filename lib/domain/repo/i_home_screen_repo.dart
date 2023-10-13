import 'package:note_app/domain/failures/main_failures.dart';
import 'package:note_app/domain/model/notes_model/note_model.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeScreenRepository {
  Future<Either<MainFailures, NoteModel>> createNote(
      {required NoteModel value});
  Future<Either<MainFailures, List<NoteModel>>> getAllNotes();
  Future<Either<MainFailures, NoteModel?>> updateNote(
      {required NoteModel value});
  Future<void> deleteNote(String id);
}
