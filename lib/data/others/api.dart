// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/model/get_all_notes_response/get_all_notes_response.dart';
import 'package:note_app/data/model/notes_model/note_model.dart';
import 'package:note_app/data/others/url.dart';

abstract class ApiCall {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>> getAllNotes();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<void> deleteNote(String id);
}

class NoteDb extends ApiCall {
  //singleton
  NoteDb.internal();
  static NoteDb instance = NoteDb.internal();
  NoteDb factory() {
    return instance;
  }

  //singletonends
  final dio = Dio();
  final url = Url();
  NoteDb() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
    );
  }

  ValueNotifier<List<NoteModel>> noteListNotifier = ValueNotifier([]);

  @override
  Future<NoteModel?> createNote(NoteModel value) async {
    try {
      final result = await dio.post(
        url.createNoteUrl,
        data: value.toJson(),
      );
      final resultAsJson = jsonDecode(result.toString());
      final note = NoteModel.fromJson(resultAsJson as Map<String, dynamic>);
      noteListNotifier.value.insert(0, note);
      noteListNotifier.notifyListeners();
      return note;
    } on DioException catch (e) {
      print(e.response?.data);
      print(e);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    final result = await dio
        .delete(url.baseUrl + url.deleteNoteUrl.replaceFirst('{id}', id));
    if (result.data == null) {
      return;
    }
    final index =
        noteListNotifier.value.indexWhere((element) => element.id == id);
    if (index == -1) {
      return;
    }
    noteListNotifier.value.removeAt(index);
    noteListNotifier.notifyListeners();
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final result = await dio.get(url.baseUrl + url.getAllNotesUrl);
      final resultAsJson = jsonDecode(result.toString());
      if (result.data != null) {
        final getNotesResp = GetAllNotesResponse.fromJson(resultAsJson);

        noteListNotifier.value.clear();
        noteListNotifier.value.addAll(getNotesResp.data.reversed);
        noteListNotifier.notifyListeners();
        return getNotesResp.data;
      } else {
        noteListNotifier.value.clear();
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<NoteModel?> updateNote(NoteModel value) async {
    try {
      await dio.put(url.baseUrl + url.updateNoteUrl, data: value.toJson());
//findindex
      final index =
          noteListNotifier.value.where((element) => element.id == value.id);
//removefromindex
      noteListNotifier.value.removeAt(index as int);
//addnoteinthatindex
      noteListNotifier.value.insert(index as int, value);
      noteListNotifier.notifyListeners();
      return value;
    } catch (_) {
      return null;
    }
  }

  NoteModel? getNoteById(String id) {
    try {
      return noteListNotifier.value.firstWhere((element) => element.id == id);
    } catch (_) {
      return null;
    }
  }
}
