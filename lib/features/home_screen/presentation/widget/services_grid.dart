import 'package:flutter/material.dart';
import 'package:islam_moshaf/features/home_screen/presentation/widget/service_item.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/screen/quran_audio_screen.dart';
import 'package:islam_moshaf/features/quran_text/presentation/screen/moshaf_list/quran_list_screen.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "الخدمات",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 18),

        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: .95,
          ),
          children: [

            ServiceItem(
              title: "القرآن",
              icon: Icons.menu_book_rounded,
              onTap: () {
                Navigator.pushNamed(context, QuranListScreen.routeName);
              },
            ),

            ServiceItem(
              title: "الصوتيات",
              icon: Icons.headphones_rounded,
              onTap: () {
                Navigator.pushNamed(context, QuranAudioScreen.routeName);
              },
            ),

            ServiceItem(
              title: "مواقيت الصلاة",
              icon: Icons.access_time_filled_rounded,
              onTap: () {},
            ),

            ServiceItem(
              title: "الأذكار",
              icon: Icons.favorite_rounded,
              onTap: () {},
            ),

            ServiceItem(
              title: "السبحة",
              icon: Icons.touch_app_rounded,
              onTap: () {},
            ),

            ServiceItem(
              title: "المحفوظات",
              icon: Icons.bookmark_rounded,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}