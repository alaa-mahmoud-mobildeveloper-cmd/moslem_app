import 'package:flutter/material.dart';
import 'package:islam_moshaf/features/quran_text/presentation/widgets/al_bsmalh.dart';

class AyahItem extends StatelessWidget {
  final List<dynamic> ayahs;
  final int surahNumber;
   const AyahItem({super.key, required this.ayahs,required this.surahNumber,});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            if (surahNumber != 0 && surahNumber != 9)
              RoyalIslamicFrame(
                child: const Text(
                  "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF064439),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Text.rich(
              textAlign: TextAlign.justify,
              TextSpan(
                children: List.generate(ayahs.length, (index) {
                  final ayah= ayahs[index];
                  if (ayah == null) return const TextSpan(text: "");
                  String ayahText = ayah.text ?? "";
                  return TextSpan(
                    text: ayahText,
                    style: const TextStyle(
                      color: Color(0xFF255A25),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 2.0,
                    ),
                    children: [
                      TextSpan(
                        text:"﴿${ayah.numberInSurah}﴾",
                        style: const TextStyle(
                          color: Color(0xFF16A143),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                  );
                }
                  ,
              ),

              )

            ),
          ],
        )
    );
  }
}
