import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/di.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_bloc.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_event.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/surah_screen/surah_screen.dart';
import 'package:islam_moshaf/features/quran_text/presentation/widgets/surah_item_widget.dart';
import 'package:islam_moshaf/features/quran_text/presentation/widgets/titel_item.dart';
import 'package:islam_moshaf/features/search_quran/presentation/screen/search_quran_screen.dart';

class QuranListScreen extends StatefulWidget {
  static const String routeName = 'quran_list_screen';

  const QuranListScreen({super.key});

  @override
  State<QuranListScreen> createState() => _QuranListScreenState();
}

class _QuranListScreenState extends State<QuranListScreen> {
  late final ScrollController controller ;

  @override
  void initState() {

    super.initState();
    controller = ScrollController();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuranBloc>()..add(GetSurahEvent()),
      child: BlocBuilder<QuranBloc, QuranState>(
        builder: (context, state) {
          final model = state.surahList?.data;

          if (state.status == RequestStatus.loading) {
            return const Scaffold(
              backgroundColor: Color(0xFFF6FFF8),
              body: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF16A34A),
                ),
              ),
            );
          }

          if (state.status == RequestStatus.error) {
            return Scaffold(
              backgroundColor: const Color(0xFFF6FFF8),
              body: Center(
                child: Text(
                  state.message ?? "Something went wrong",
                  style: const TextStyle(
                    color: Color(0xFF064E3B),
                    fontSize: 18,
                  ),
                ),
              ),
            );
          }

          return Scaffold(
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
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: AnimatedBuilder(
                        animation: controller,
                         builder: (context, child) {
                           return CustomScrollView(
                             physics: const BouncingScrollPhysics(),
                             controller: controller,
                             slivers: [
                               SliverToBoxAdapter(
                                 child: TitleItem(
                                   number: model?.length ?? 0,
                                   title: 'القرآن الكريم',
                                   onTap: () {
                                     Navigator.pushNamed(context, SearchQuranScreen.routeName);
                                   },
                                   onBack: () {
                                     Navigator.pop(context);
                                   },
                                 ),

                               ),

                               SliverToBoxAdapter(
                                   child: SizedBox(height: 30,)),
                               SliverList.builder(
                                   itemCount: model?.length ?? 0,
                                   itemBuilder: (context, index) {
                                     final surah = model?[index];
                                     double offset=0;
                                     if(controller.hasClients){
                                       offset = (controller.offset/160)-index;}
                                     double scaleOffset = (1-(offset.clamp(0, 1)*0.2));
                                         return Transform.scale(
                                           scale:scaleOffset ,
                                           child: GestureDetector(
                                             onTap: (){
                                               final currentSurah = surah;
                                               Navigator.pushNamed(
                                                   context, SurahScreen.routeName,
                                                 arguments: {
                                                   'surahNumber': currentSurah?.number ?? 1,
                                                   'arName': currentSurah?.name ?? "سورة",
                                                   'enName': currentSurah?.englishName ?? "سورة",
                                                 }
                                               );
                                             },
                                             child: SurahItemWidgetCard(
                                               number: surah?.number ?? 0,
                                               nameAr: '${surah?.name}',
                                               nameEn: '${surah?.englishName}',
                                               versesCount: '${surah
                                                   ?.numberOfAyahs}',),
                                           ),
                                         );
                                       },



                               ),

                             ],

                           );

                         }
                      ),
                      ),
                    )


              ],
            ),
          );
        },
      ),
    );
  }
}