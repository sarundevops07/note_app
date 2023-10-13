import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/failures/main_failures.dart';
import 'package:note_app/domain/model/notes_model/note_model.dart';
import 'package:note_app/domain/repo/i_home_screen_repo.dart';

part 'note_app_event.dart';
part 'note_app_state.dart';
part 'note_app_bloc.freezed.dart';

@injectable
class NoteAppBloc extends Bloc<NoteAppEvent, NoteAppState> {
  final IHomeScreenRepository iHomeScreenRepository;
  NoteAppBloc(this.iHomeScreenRepository) : super(NoteAppState.initial()) {
//* TO CREATE NOTE

    on<CreateNote>((event, emit) async {
      // initial state

      emit(const NoteAppState(isError: false, notes: []));

      // add note to data base

      await iHomeScreenRepository.createNote(value: event.value);
    });

//* TO GET ALL NOTES

    on<GetAllNotes>((event, emit) async {
      // initial state

      emit(const NoteAppState(isError: false, notes: []));

      // get data from data base

      final result = await iHomeScreenRepository.getAllNotes();

      // display to ui

      final listOfNotes = result.fold(
          (MainFailures failures) => state.copyWith(isError: true, notes: []),
          (List<NoteModel> success) =>
              state.copyWith(isError: false, notes: success));

      emit(listOfNotes);
    });

//* TO UPDATE NOTE

    on<UpdateNote>((event, emit) async {
      // initial state

      emit(const NoteAppState(isError: false, notes: []));

      // update note to data base

      await iHomeScreenRepository.updateNote(value: event.value);
    });
  }
}
