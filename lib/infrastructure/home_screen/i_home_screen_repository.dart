import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/const/url.dart';
import 'package:note_app/domain/failures/main_failures.dart';
import 'package:note_app/domain/model/get_all_notes_response/get_all_notes_response.dart';
import 'package:note_app/domain/model/notes_model/note_model.dart';
import 'package:note_app/domain/repo/i_home_screen_repo.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IHomeScreenRepository)
class NoteRepository extends IHomeScreenRepository {
  final dio = Dio();
  final url = Url();

// TO CREATE NOTE

  @override
  Future<Either<MainFailures, NoteModel>> createNote(
      {required NoteModel value}) async {
    try {
      final response =
          await dio.post(url.baseUrl + url.createNoteUrl, data: value.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());
        final notes = NoteModel.fromJson(response.data);
        return right(notes);
      } else {
        return left(const MainFailures.clientFailures());
      }
    } on DioException catch (e) {
      log(e.toString());
      return left(const MainFailures.clientFailures());
    } catch (e) {
      log(e.toString());
      return left(const MainFailures.serverFailures());
    }
  }

  // TO DELETE NOTE

  @override
  Future<void> deleteNote(String id) async {
    try {
      final Response response = await dio
          .delete(url.baseUrl + url.deleteNoteUrl.replaceFirst('{id}', id));
      if (response.data == null) {
        return;
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final notes = GetAllNotesResponse.fromJson(response.data);

        // find the index to delete

        final index = notes.data.indexWhere((element) => element.id == id);

        // delete

        notes.data.removeAt(index);
      }
    } catch (e) {
      log(e.toString());
    }
  }

// TO GET ALL NOTES

  @override
  Future<Either<MainFailures, List<NoteModel>>> getAllNotes() async {
    try {
      final response = await dio.get(url.baseUrl + url.getAllNotesUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());
        final result = GetAllNotesResponse.fromJson(response.data);
        return right(result.data);
      } else {
        return left(const MainFailures.clientFailures());
      }
    } on DioException catch (e) {
      log(e.toString());
      return left(const MainFailures.clientFailures());
    } catch (e) {
      log(e.toString());
      return left(const MainFailures.serverFailures());
    }
  }

// TO UPDATE NOTES

  @override
  Future<Either<MainFailures, NoteModel?>> updateNote(
      {required NoteModel value}) async {
    try {
      final response =
          await dio.put(url.baseUrl + url.updateNoteUrl, data: value.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());
        final notes = GetAllNotesResponse.fromJson(response.data);

        // find index
        final index = notes.data.indexWhere(
          (element) => element.id == value.id,
        );
        // remove from index
        if (index != -1) {
          notes.data.removeAt(index);
        }
        // update note to the index
        notes.data.insert(index, value);

        return right(value);
      } else {
        return left(const MainFailures.clientFailures());
      }
    } on DioException catch (e) {
      log(e.toString());
      return left(const MainFailures.clientFailures());
    } catch (e) {
      log(e.toString());
      return left(const MainFailures.serverFailures());
    }
  }
}
