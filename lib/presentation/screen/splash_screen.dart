import 'package:flutter/material.dart';
import 'package:note_app/presentation/screen/note_app_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  final splashScreenImage = "lib/asset/eccfa11fd98660b1c9e8f6799a140c93.jpg";
  final splashScreenImage2 = "lib/asset/b6cde81d1c489b0e20d85a6e06c5f8f9.png";
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NoteAppHome()),
      );
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          width: 100,
          height: 100,
          splashScreenImage2,
        ),
      ),
    );
  }
}
