import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main%20page/widgets/scren_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'netflix',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: BackgroundColor,
        fontFamily: GoogleFonts.montserrat().fontFamily,
       textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white)
          )
      ),
      home: ScrrenMainPage(),
    );
    
  }
}

