import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/di.dart' show getIt;
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/surah_screen/surah_screen.dart';
import 'package:islam_moshaf/features/quran_text/presentation/widgets/icon_bar.dart';
import 'package:islam_moshaf/features/quran_text/presentation/widgets/surah_item_widget.dart';
import 'package:islam_moshaf/features/search_quran/presentation/manager/search_bloc.dart';
import 'package:islam_moshaf/features/search_quran/presentation/manager/search_event.dart';
import 'package:islam_moshaf/features/search_quran/presentation/manager/search_state.dart';
import 'package:islam_moshaf/features/search_quran/presentation/widgets/search_item.dart';

class SearchQuranScreen extends StatefulWidget {
  static const String routeName="SearchQuranScreen";
  const SearchQuranScreen({super.key});

  @override
  State<SearchQuranScreen> createState() => _SearchQuranScreenState();
}

class _SearchQuranScreenState extends State<SearchQuranScreen> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                child: Column(
                  spacing: 20,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: IconsBar(
                              icon: Icons.arrow_back_ios_new,
                            ),
                          )
                        ],
                      ),
                      Builder(
                        builder: (innerContext) {
                          return SearchItem(
                            controller: searchController,
                            onChanged: (value) {

                              innerContext.read<SearchBloc>().add(GetSearchSurahEvent(name: value));
                            },
                          );
                        },
                      ),

                      Expanded(
                          child:BlocBuilder<SearchBloc, SearchState>(
                              builder: (context, state){
                                final model = state.surahList;
                                if (state.status == RequestStatus.loading) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xFF16A34A),
                                    ),
                                  );
                                }

                                if (state.status == RequestStatus.error) {
                                  return Center(
                                    child: Text(
                                        state.message ?? "حدث خطأ ما",
                                        style: const TextStyle(color: Colors.red, fontSize: 16),
                                  ),
                                );
                              }
                                if (state.status == RequestStatus.success) {

                                  if (state.surahList.isEmpty) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF16A34A).withOpacity(0.08),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.search_rounded,
                                              size: 64,
                                              color: Color(0xFF16A34A),
                                            ),
                                          ),
                                          const SizedBox(height: 16),

                                          const Text(
                                            "ابدأ بالبحث عن السورة المرجوة",
                                            style: TextStyle(
                                              color: Color(0xFF064E3B),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Cairo',
                                            ),
                                          ),
                                          const SizedBox(height: 6),

                                          Text(
                                            "اكتب اسم السورة أو جزءاً منها في خانة البحث فوق",
                                            style: TextStyle(
                                              color: const Color(0xFF064E3B).withOpacity(0.6),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    itemCount: state.surahList.length,
                                    itemBuilder: (context, index) {
                                      final surah = model[index];


                                      return GestureDetector(
                                        onTap: (){
                                          final currentSurah = surah;
                                          Navigator.pushNamed(
                                              context, SurahScreen.routeName,
                                              arguments: {
                                                'surahNumber': currentSurah.number ?? 1,
                                                'arName': currentSurah.name ?? "سورة",
                                                'enName': currentSurah.englishName ?? "سورة",
                                              }
                                          );
                                        },
                                        child: SurahItemWidgetCard(
                                          number: surah.number ?? 0,
                                          nameAr: '${surah.name}',
                                          nameEn: '${surah.englishName}',
                                          versesCount: '${surah.numberOfAyahs}',
                                        ),
                                      );
                                    },
                                  );
                                }
                                return const SizedBox();
                              }
                          )
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
