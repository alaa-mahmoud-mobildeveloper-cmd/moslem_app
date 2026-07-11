import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/manager/quran_audio_bloc.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/widgets/audio_header.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/widgets/audio_search_bar.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/widgets/filter_chips.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/widgets/last_played_card.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/widgets/section_title.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/widgets/surah_audio_item.dart';

class QuranAudioScreen extends StatefulWidget {
  static const String routeName = 'quran_audio_screen';

   QuranAudioScreen({super.key});

  @override
  State<QuranAudioScreen> createState() => _QuranAudioScreenState();
}

class _QuranAudioScreenState extends State<QuranAudioScreen> {
   TextEditingController controller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => QuranAudioBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6FFF8),
        body: Stack(
          children: [

            Positioned(
              top: -120,
              right: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(
                    0xFFBBF7D0,
                  ).withOpacity(.7),
                ),
              ),
            ),

            Positioned(
              bottom: -150,
              left: -100,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(
                    0xFF86EFAC,
                  ).withOpacity(.35),
                ),
              ),
            ),


            SafeArea(
                child: SafeArea(
                  child: Column(
                    children: [

                      const SizedBox(height: 20),

                      AudioHeader(),

                      const SizedBox(height: 18),

                      AudioSearchWidget(controller: controller,),
                      const SizedBox(height: 18),
                      const FilterChips(),
                      const SizedBox(height: 18),

                      ContinueListeningCard(
                        surahName: "سورة البقرة",
                        readerName: "الشيخ مشاري العفاسي",
                        currentPosition: const Duration(minutes: 7, seconds: 10),
                        totalDuration: const Duration(minutes: 48, seconds: 35),
                        onPlay: () {},
                      ),

                      const SizedBox(height: 22),

                      SectionTitle(
                        title: "جميع السور",
                      ),

                      const SizedBox(height: 12),

                      Expanded(
                        child: ListView.builder(
                          itemCount: 14,
                          itemBuilder: (context, index) {
                            return SurahAudioItem(
                              number: index + 1,
                              nameAr: "سورة الفاتحة",
                              nameEn: "Al-Fatiha",
                              versesCount: "7",
                              isPlaying: index == 0,
                              onTap: () {},
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
            )


          ],
        ),
      ),
    );
  }
}
