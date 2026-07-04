import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/di.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_bloc.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_event.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/surah_screen/surah_screen.dart';

class QuranListScreen extends StatelessWidget {
  static const String routeName = 'quran_list_screen';

  const QuranListScreen({super.key});

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
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 16,
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [

                                  _glassIcon(
                                    icon: Icons.grid_view_rounded,
                                  ),

                                  _glassIcon(
                                    icon:
                                    Icons.favorite_border_rounded,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 30),

                              ShaderMask(
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Color(0xFF15803D),
                                      Color(0xFF22C55E),
                                    ],
                                  ).createShader(bounds);
                                },
                                child: const Text(
                                  "القرآن الكريم",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w900,

                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),

                              Container(
                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  Colors.white.withOpacity(.85),
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  border: Border.all(
                                    color: const Color(
                                      0xFFD1FAE5,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "${model?.length ?? 0} سورة",
                                  style: const TextStyle(
                                    color: Color(0xFF166534),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 35),

                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(28),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20,
                                    sigmaY: 20,
                                  ),
                                  child: Container(
                                    height: 68,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(28),
                                      border: Border.all(
                                        color: const Color(
                                          0xFFD1FAE5,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(
                                            0xFF22C55E,
                                          ).withOpacity(.08),
                                          blurRadius: 20,
                                          offset:
                                          const Offset(
                                            0,
                                            10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color: Color(0xFF064E3B),
                                        fontSize: 18,
                                      ),
                                      decoration:
                                      const InputDecoration(
                                        border:
                                        InputBorder.none,
                                        hintText:
                                        "ابحث عن سورة...",
                                        hintStyle:
                                        TextStyle(
                                          color: Color(
                                            0xFF6EE7B7,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search_rounded,
                                          color:
                                          Color(0xFF16A34A),
                                          size: 30,
                                        ),
                                        contentPadding:
                                        EdgeInsets.symmetric(
                                          vertical: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 35),
                            ],
                          ),
                        ),
                      ),

                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        sliver: SliverList(
                          delegate:
                          SliverChildBuilderDelegate(
                                (context, index) {

                              final surah = model![index];

                              return TweenAnimationBuilder(
                                duration: Duration(
                                  milliseconds:
                                  300 + (index * 70),
                                ),
                                tween: Tween(
                                  begin: 0.0,
                                  end: 1.0,
                                ),
                                builder:
                                    (context, value, child) {

                                  return Transform.translate(
                                    offset:
                                    Offset(
                                      0,
                                      40 * (1 - value),
                                    ),
                                    child: Opacity(
                                      opacity: value,
                                      child: child,
                                    ),
                                  );
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      SurahScreen.routeName,
                                      arguments:
                                      surah.number,
                                    );
                                  },
                                  child: Container(
                                    margin:
                                    const EdgeInsets.only(
                                      bottom: 22,
                                    ),
                                    padding:
                                    const EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                        32,
                                      ),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(
                                          0xFFD1FAE5,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(
                                            0xFF22C55E,
                                          ).withOpacity(
                                            .08,
                                          ),
                                          blurRadius: 20,
                                          offset:
                                          const Offset(
                                            0,
                                            10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [

                                        Container(
                                          width: 72,
                                          height: 72,
                                          decoration:
                                          BoxDecoration(
                                            shape:
                                            BoxShape.circle,
                                            gradient:
                                            const LinearGradient(
                                              colors: [
                                                Color(
                                                  0xFF22C55E,
                                                ),
                                                Color(
                                                  0xFF15803D,
                                                ),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(
                                                  0xFF22C55E,
                                                ).withOpacity(
                                                  .25,
                                                ),
                                                blurRadius:
                                                20,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${surah.number}",
                                              style:
                                              const TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize: 24,
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(
                                          width: 18,
                                        ),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [

                                              Text(
                                                surah.englishName ??
                                                    "",
                                                style:
                                                const TextStyle(
                                                  color:
                                                  Color(
                                                    0xFF6B7280,
                                                  ),
                                                  fontSize:
                                                  14,
                                                  fontWeight:
                                                  FontWeight
                                                      .w500,
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 8,
                                              ),

                                              Text(
                                                surah.name ??
                                                    "",
                                                style:
                                                const TextStyle(
                                                  color:
                                                  Color(
                                                    0xFF064E3B,
                                                  ),
                                                  fontSize:
                                                  28,
                                                  fontWeight:
                                                  FontWeight
                                                      .w800,
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 12,
                                              ),

                                              Container(
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                  horizontal:
                                                  14,
                                                  vertical:
                                                  7,
                                                ),
                                                decoration:
                                                BoxDecoration(
                                                  color: const Color(
                                                    0xFFDCFCE7,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                    40,
                                                  ),
                                                ),
                                                child: Text(
                                                  "${surah.numberOfAyahs} آية",
                                                  style:
                                                  const TextStyle(
                                                    color: Color(
                                                      0xFF15803D,
                                                    ),
                                                    fontWeight:
                                                    FontWeight
                                                        .w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const Icon(
                                          Icons
                                              .arrow_forward_ios_rounded,
                                          color: Color(
                                            0xFF9CA3AF,
                                          ),
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount:
                            model?.length ?? 0,
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(
                        child: SizedBox(height: 40),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _glassIcon({
    required IconData icon,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.9),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: const Color(0xFFD1FAE5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.03),
                blurRadius: 10,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xFF16A34A),
          ),
        ),
      ),
    );
  }
}