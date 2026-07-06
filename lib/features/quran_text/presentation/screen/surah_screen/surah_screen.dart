import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/di.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_bloc.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_event.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';
import 'package:islam_moshaf/features/quran_text/presentation/widgets/ayah_item.dart';

class SurahScreen extends StatelessWidget {
  static const String routeName = 'surah_screen';
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int surahNumber = args['surahNumber'];
    final String arName = args['arName'];
    final String enName = args['enName'];

    return BlocProvider(
      create: (context) =>
          getIt<QuranBloc>()..add(GetSurahDetailsEvent(surahNumber)),
      child: BlocConsumer<QuranBloc, QuranState>(
        builder: (context, state) {
          if (state.status == RequestStatus.loading) {
            return Scaffold(body: Center(child: CircularProgressIndicator(
              color: Color(0xFF16A34A),
            )));
          }

          if (state.status == RequestStatus.error) {
            return Scaffold(
              body: Center(child: Text(state.message ?? "Error")),
            );
          }

          if (state.status == RequestStatus.success) {
            final model = state.surahDetails!;

            return Scaffold(
              backgroundColor: const Color(0xFFE8F5E9),
              appBar: AppBar(
                toolbarHeight: 80,
                backgroundColor: const Color(0xFF16A143),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(150, 20),
                  ),
                ),
                title: Column(
                  children: [
                    Text(
                      arName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      enName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:AyahItem(
                  ayahs: model.data!.ayahs!,
                  surahNumber: model.data?.number??0,
                ),
              )
            );
          }

          return Scaffold(body: SizedBox());
        },
        listener: (context, state) {
          if (state.status == RequestStatus.error) {
            print(state.message);
          }
          if (state.status == RequestStatus.success) {
            print(state.surahDetails!.data!.ayahs![0].text);
          }
          if (state.status == RequestStatus.loading) {
            print("loading");
          }
        },
      ),
    );
  }
}
