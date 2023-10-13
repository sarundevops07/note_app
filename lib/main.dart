import 'package:flutter/material.dart';
import 'package:note_app/application/bloc/note_app_bloc.dart';
import 'package:note_app/domain/dependency_injection/injectable.dart';
import 'package:note_app/presentation/spash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => getIt<NoteAppBloc>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ));
  }
}
