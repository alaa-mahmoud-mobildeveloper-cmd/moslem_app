import 'package:flutter/material.dart';
import 'package:islam_moshaf/features/quran_text/presentation/widgets/icon_bar.dart';

class TitleItem extends StatelessWidget {
  int number;
  String title;
  TitleItem({super.key, required this.number,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xFF15803D),
                    Color(0xFF22C55E),
                  ],
                ).createShader(bounds);
              },
              child:  Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,

                ),
                textAlign: TextAlign.start,
              ),
            ),

            IconsBar(
              icon: Icons.search,),
          ],
        ),
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
            "$number   سورة",
            style: const TextStyle(
              color: Color(0xFF166534),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      ],
    );
  }
}
