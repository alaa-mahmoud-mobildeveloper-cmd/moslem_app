import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/manager/quran_audio_bloc.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/widgets/surah_item_widget.dart';

class QuranAudioScreen extends StatelessWidget {
  static const String routeName = 'quran_audio_screen';

  const QuranAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => QuranAudioBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quran Audio'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SurahItemWidget(
              number: 1,
              nameAr: 'الفاتحه',
              nameEn: 'Al_Fatha',
              versesCount: '7',
              onTap: () {},
              audioUrl: 'https://download.quranicaudio.com/qdc/abdul_baset/mujawwad/10.mp3',)
          ],
        ),
      ),
    );
  }
}
