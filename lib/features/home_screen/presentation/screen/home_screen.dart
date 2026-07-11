import 'package:flutter/material.dart';
import 'package:islam_moshaf/core/widgets/islamic_background.dart';
import 'package:islam_moshaf/features/home_screen/presentation/widget/daily_ayah_card.dart';
import 'package:islam_moshaf/features/home_screen/presentation/widget/home_header.dart';
import 'package:islam_moshaf/features/home_screen/presentation/widget/last_read_card.dart';
import 'package:islam_moshaf/features/home_screen/presentation/widget/next_prayer_card.dart';
import 'package:islam_moshaf/features/home_screen/presentation/widget/services_grid.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IslamicBackground(
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              /// Header
              const SliverToBoxAdapter(
                child: HomeHeader(),
              ),

              /// Next Prayer
              const SliverPadding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 20,
                  right: 20,
                ),
                sliver: SliverToBoxAdapter(
                  child: NextPrayerCard(),
                ),
              ),

              /// Daily Ayah
              const SliverPadding(
                padding: EdgeInsets.only(
                  top: 28,
                  left: 20,
                  right: 20,
                  bottom: 30,
                ),
                sliver: SliverToBoxAdapter(
                  child: DailyAyahCard(),
                ),
              ),
              /// Last Read
              const SliverPadding(
                padding: EdgeInsets.only(
                  top: 22,
                  left: 20,
                  right: 20,
                ),
                sliver: SliverToBoxAdapter(
                  child: LastReadCard(),
                ),
              ),

              /// Services
              const SliverPadding(
                padding: EdgeInsets.only(
                  top: 28,
                  left: 20,
                  right: 20,
                ),
                sliver: SliverToBoxAdapter(
                  child: ServicesGrid(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}