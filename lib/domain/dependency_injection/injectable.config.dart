// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:note_app/application/bloc/note_app_bloc.dart' as _i5;
import 'package:note_app/domain/repo/i_home_screen_repo.dart' as _i3;
import 'package:note_app/infrastructure/home_screen/i_home_screen_repository.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IHomeScreenRepository>(() => _i4.NoteRepository());
    gh.factory<_i5.NoteAppBloc>(
        () => _i5.NoteAppBloc(gh<_i3.IHomeScreenRepository>()));
    return this;
  }
}
