import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/di.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_bloc.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_event.dart';
import 'package:islam_moshaf/features/quran_text/presentation/manager/quran_state.dart';

class SurahScreen extends StatelessWidget {
  static const String routeName = 'surah_screen';
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surahNumber = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) =>
          getIt<QuranBloc>()..add(GetSurahDetailsEvent(surahNumber)),
      child: BlocConsumer<QuranBloc, QuranState>(
        builder: (context, state) {
          if (state.status == RequestStatus.loading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
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
                      state.surahDetails!.data!.name ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      state.surahDetails!.data!.englishName ?? "",
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
              body: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: model.data!.ayahs!.length,
                itemBuilder: (context, index) {
                  final ayah = model.data!.ayahs![index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${ayah.text}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF064439),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
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
