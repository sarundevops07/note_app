// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteAppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteModel value) createNote,
    required TResult Function() getAllNotes,
    required TResult Function(NoteModel value) updateNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteModel value)? createNote,
    TResult? Function()? getAllNotes,
    TResult? Function(NoteModel value)? updateNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteModel value)? createNote,
    TResult Function()? getAllNotes,
    TResult Function(NoteModel value)? updateNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(GetAllNotes value) getAllNotes,
    required TResult Function(UpdateNote value) updateNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNote value)? createNote,
    TResult? Function(GetAllNotes value)? getAllNotes,
    TResult? Function(UpdateNote value)? updateNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(GetAllNotes value)? getAllNotes,
    TResult Function(UpdateNote value)? updateNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteAppEventCopyWith<$Res> {
  factory $NoteAppEventCopyWith(
          NoteAppEvent value, $Res Function(NoteAppEvent) then) =
      _$NoteAppEventCopyWithImpl<$Res, NoteAppEvent>;
}

/// @nodoc
class _$NoteAppEventCopyWithImpl<$Res, $Val extends NoteAppEvent>
    implements $NoteAppEventCopyWith<$Res> {
  _$NoteAppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateNoteCopyWith<$Res> {
  factory _$$CreateNoteCopyWith(
          _$CreateNote value, $Res Function(_$CreateNote) then) =
      __$$CreateNoteCopyWithImpl<$Res>;
  @useResult
  $Res call({NoteModel value});
}

/// @nodoc
class __$$CreateNoteCopyWithImpl<$Res>
    extends _$NoteAppEventCopyWithImpl<$Res, _$CreateNote>
    implements _$$CreateNoteCopyWith<$Res> {
  __$$CreateNoteCopyWithImpl(
      _$CreateNote _value, $Res Function(_$CreateNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CreateNote(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }
}

/// @nodoc

class _$CreateNote implements CreateNote {
  const _$CreateNote({required this.value});

  @override
  final NoteModel value;

  @override
  String toString() {
    return 'NoteAppEvent.createNote(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNote &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNoteCopyWith<_$CreateNote> get copyWith =>
      __$$CreateNoteCopyWithImpl<_$CreateNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteModel value) createNote,
    required TResult Function() getAllNotes,
    required TResult Function(NoteModel value) updateNote,
  }) {
    return createNote(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteModel value)? createNote,
    TResult? Function()? getAllNotes,
    TResult? Function(NoteModel value)? updateNote,
  }) {
    return createNote?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteModel value)? createNote,
    TResult Function()? getAllNotes,
    TResult Function(NoteModel value)? updateNote,
    required TResult orElse(),
  }) {
    if (createNote != null) {
      return createNote(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(GetAllNotes value) getAllNotes,
    required TResult Function(UpdateNote value) updateNote,
  }) {
    return createNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNote value)? createNote,
    TResult? Function(GetAllNotes value)? getAllNotes,
    TResult? Function(UpdateNote value)? updateNote,
  }) {
    return createNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(GetAllNotes value)? getAllNotes,
    TResult Function(UpdateNote value)? updateNote,
    required TResult orElse(),
  }) {
    if (createNote != null) {
      return createNote(this);
    }
    return orElse();
  }
}

abstract class CreateNote implements NoteAppEvent {
  const factory CreateNote({required final NoteModel value}) = _$CreateNote;

  NoteModel get value;
  @JsonKey(ignore: true)
  _$$CreateNoteCopyWith<_$CreateNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllNotesCopyWith<$Res> {
  factory _$$GetAllNotesCopyWith(
          _$GetAllNotes value, $Res Function(_$GetAllNotes) then) =
      __$$GetAllNotesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllNotesCopyWithImpl<$Res>
    extends _$NoteAppEventCopyWithImpl<$Res, _$GetAllNotes>
    implements _$$GetAllNotesCopyWith<$Res> {
  __$$GetAllNotesCopyWithImpl(
      _$GetAllNotes _value, $Res Function(_$GetAllNotes) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllNotes implements GetAllNotes {
  const _$GetAllNotes();

  @override
  String toString() {
    return 'NoteAppEvent.getAllNotes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllNotes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteModel value) createNote,
    required TResult Function() getAllNotes,
    required TResult Function(NoteModel value) updateNote,
  }) {
    return getAllNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteModel value)? createNote,
    TResult? Function()? getAllNotes,
    TResult? Function(NoteModel value)? updateNote,
  }) {
    return getAllNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteModel value)? createNote,
    TResult Function()? getAllNotes,
    TResult Function(NoteModel value)? updateNote,
    required TResult orElse(),
  }) {
    if (getAllNotes != null) {
      return getAllNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(GetAllNotes value) getAllNotes,
    required TResult Function(UpdateNote value) updateNote,
  }) {
    return getAllNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNote value)? createNote,
    TResult? Function(GetAllNotes value)? getAllNotes,
    TResult? Function(UpdateNote value)? updateNote,
  }) {
    return getAllNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(GetAllNotes value)? getAllNotes,
    TResult Function(UpdateNote value)? updateNote,
    required TResult orElse(),
  }) {
    if (getAllNotes != null) {
      return getAllNotes(this);
    }
    return orElse();
  }
}

abstract class GetAllNotes implements NoteAppEvent {
  const factory GetAllNotes() = _$GetAllNotes;
}

/// @nodoc
abstract class _$$UpdateNoteCopyWith<$Res> {
  factory _$$UpdateNoteCopyWith(
          _$UpdateNote value, $Res Function(_$UpdateNote) then) =
      __$$UpdateNoteCopyWithImpl<$Res>;
  @useResult
  $Res call({NoteModel value});
}

/// @nodoc
class __$$UpdateNoteCopyWithImpl<$Res>
    extends _$NoteAppEventCopyWithImpl<$Res, _$UpdateNote>
    implements _$$UpdateNoteCopyWith<$Res> {
  __$$UpdateNoteCopyWithImpl(
      _$UpdateNote _value, $Res Function(_$UpdateNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdateNote(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }
}

/// @nodoc

class _$UpdateNote implements UpdateNote {
  const _$UpdateNote({required this.value});

  @override
  final NoteModel value;

  @override
  String toString() {
    return 'NoteAppEvent.updateNote(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNote &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNoteCopyWith<_$UpdateNote> get copyWith =>
      __$$UpdateNoteCopyWithImpl<_$UpdateNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteModel value) createNote,
    required TResult Function() getAllNotes,
    required TResult Function(NoteModel value) updateNote,
  }) {
    return updateNote(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteModel value)? createNote,
    TResult? Function()? getAllNotes,
    TResult? Function(NoteModel value)? updateNote,
  }) {
    return updateNote?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteModel value)? createNote,
    TResult Function()? getAllNotes,
    TResult Function(NoteModel value)? updateNote,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNote value) createNote,
    required TResult Function(GetAllNotes value) getAllNotes,
    required TResult Function(UpdateNote value) updateNote,
  }) {
    return updateNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNote value)? createNote,
    TResult? Function(GetAllNotes value)? getAllNotes,
    TResult? Function(UpdateNote value)? updateNote,
  }) {
    return updateNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNote value)? createNote,
    TResult Function(GetAllNotes value)? getAllNotes,
    TResult Function(UpdateNote value)? updateNote,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(this);
    }
    return orElse();
  }
}

abstract class UpdateNote implements NoteAppEvent {
  const factory UpdateNote({required final NoteModel value}) = _$UpdateNote;

  NoteModel get value;
  @JsonKey(ignore: true)
  _$$UpdateNoteCopyWith<_$UpdateNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NoteAppState {
  bool get isError => throw _privateConstructorUsedError;
  List<NoteModel> get notes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteAppStateCopyWith<NoteAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteAppStateCopyWith<$Res> {
  factory $NoteAppStateCopyWith(
          NoteAppState value, $Res Function(NoteAppState) then) =
      _$NoteAppStateCopyWithImpl<$Res, NoteAppState>;
  @useResult
  $Res call({bool isError, List<NoteModel> notes});
}

/// @nodoc
class _$NoteAppStateCopyWithImpl<$Res, $Val extends NoteAppState>
    implements $NoteAppStateCopyWith<$Res> {
  _$NoteAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $NoteAppStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isError, List<NoteModel> notes});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$NoteAppStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? notes = null,
  }) {
    return _then(_$_Initial(
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.isError, required final List<NoteModel> notes})
      : _notes = notes;

  @override
  final bool isError;
  final List<NoteModel> _notes;
  @override
  List<NoteModel> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NoteAppState(isError: $isError, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isError, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements NoteAppState {
  const factory _Initial(
      {required final bool isError,
      required final List<NoteModel> notes}) = _$_Initial;

  @override
  bool get isError;
  @override
  List<NoteModel> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
