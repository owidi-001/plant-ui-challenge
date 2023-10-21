import 'package:flutter/material.dart';
import 'package:planty/presentation/pages/start.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planty/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff76984b),
        primary: const Color(0xff76984b),
        secondary: const Color(0xff5A5A42),
        tertiary: const Color(0xff9B9E5E),
        background: const Color(0xffD2D2D4),
        outline: const Color(0xffAAAAAA),
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xffD2D2D4),
        titleTextStyle: TextStyle(
            color: StaticColors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold),
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planty challenge',
      theme: _buildTheme(Brightness.light),
      home: const StartPage(),
    );
  }
}
