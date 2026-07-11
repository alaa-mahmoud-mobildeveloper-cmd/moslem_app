import 'package:flutter/material.dart';
import 'package:islam_moshaf/features/home_screen/presentation/screen/home_screen.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/screen/quran_audio_screen.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/moshaf_list/quran_list_screen.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/surah_screen/surah_screen.dart';
import 'package:islam_moshaf/features/search_quran/presentation/screen/search_quran_screen.dart';
import 'package:islam_moshaf/features/test.dart';

import 'di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranAudioScreen.routeName: (context) =>  QuranAudioScreen(),
        QuranListScreen.routeName: (context) => const QuranListScreen(),
        SurahScreen.routeName: (context) => const SurahScreen(),
        SearchQuranScreen.routeName: (context) => const SearchQuranScreen(),
      },
      initialRoute:HomeScreen.routeName ,
    );
  }
}
