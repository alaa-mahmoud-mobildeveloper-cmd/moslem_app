import 'package:flutter/material.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/screen/quran_audio_screen.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/moshaf_list/quran_list_screen.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/surah_screen/surah_screen.dart';

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
        QuranAudioScreen.routeName: (context) => const QuranAudioScreen(),
        QuranListScreen.routeName: (context) => const QuranListScreen(),
        SurahScreen.routeName: (context) => const SurahScreen(),
      },
      initialRoute:QuranListScreen.routeName ,
    );
  }
}
