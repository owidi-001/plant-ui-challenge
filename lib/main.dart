import 'package:flutter/material.dart';
import 'package:planty/presentation/pages/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planty challenge',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              primary: const Color(0xff76984b),
              secondary: const Color(0xff76984b),
              onTertiary: const Color(0xff9fb781),
              background: const Color(0xffececee)),
          useMaterial3: true,
          // global widgets theme
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0),
          textTheme: const TextTheme(
              // titles
              // subtitles
              // body
              )),
      home: const StartPage(),
    );
  }
}
