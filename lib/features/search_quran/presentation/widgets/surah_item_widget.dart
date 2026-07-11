import 'package:flutter/material.dart';

class SurahItemWidgetCard extends StatelessWidget {
  final int number;
  final String nameAr;
  final String nameEn;
  final String versesCount;



  const SurahItemWidgetCard({
    super.key,
    required this.number,
    required this.nameAr,
    required this.nameEn,
    required this.versesCount,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                "$number",
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
               nameEn,
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
               nameAr,
                  style: const TextStyle(
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
                    "$versesCount  آية",
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
    );
  }
}