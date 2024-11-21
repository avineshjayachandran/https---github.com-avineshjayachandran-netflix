import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/Downloads/downloads_bloc.dart';
import 'package:netflix/application/fastlaugh/fast_laugh_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/core/Dependency%20Injection/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/main%20page/widgets/scren_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection();

  // Verify if SearchBloc is registered
  log('Is SearchBloc registered? ${getIt.isRegistered<SearchBloc>()}');
  log('Is fastlaughBloc registered? ${getIt.isRegistered<FastLaughBloc>()}');
  log('Is HotAndNewBloc registered? ${getIt.isRegistered<HotAndNewBloc>()}');
  log('Is HomeBloc registered? ${getIt.isRegistered<HomeBloc>()}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DownloadsBloc>(
          create: (ctx) => getIt<DownloadsBloc>(),
        ),
        BlocProvider<SearchBloc>(
          create: (ctx) => getIt<SearchBloc>(),
        ),
        BlocProvider<FastLaughBloc>(
          create: (ctx) => getIt<FastLaughBloc>(),
        ),
        BlocProvider<HotAndNewBloc>(
          create: (ctx) => getIt<HotAndNewBloc>(),
        ),
         BlocProvider<HomeBloc>(
          create: (ctx) => getIt<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'netflix',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            primarySwatch: Colors.yellow,
            scaffoldBackgroundColor: BackgroundColor,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
                bodyLarge: TextStyle(color: Colors.white))),
        home: ScreenMainPage(),
      ),
    );
  }
}
