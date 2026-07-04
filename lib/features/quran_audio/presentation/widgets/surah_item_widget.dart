import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/manager/quran_audio_bloc.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/manager/quran_audio_event.dart';
import 'package:islam_moshaf/features/quran_audio/presentation/manager/quran_audio_state.dart';

class SurahItemWidget extends StatelessWidget {
  final int number;
  final String nameAr;
  final String nameEn;
  final String versesCount;
  final String audioUrl;
  final VoidCallback onTap;

  const SurahItemWidget({
    super.key,
    required this.number,
    required this.nameAr,
    required this.nameEn,
    required this.versesCount,
    required this.audioUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF064439).withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.star_outline, color: Color(0xFFD4AF37), size: 45),
                Text(
                  '$number',
                  style: const TextStyle(
                    color: Color(0xFF064439),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            BlocBuilder<QuranAudioBloc, QuranAudioState>(
              builder: (context, state) {
                final isCurrentSurah = state.currentUrl == audioUrl;
                final isPlaying = isCurrentSurah && state.status == AudioStatus.playing;

                return IconButton(
                  onPressed: () {
                    if (isPlaying) {
                      context.read<QuranAudioBloc>().add(PauseAudioEvent());
                    } else {
                      context.read<QuranAudioBloc>().add(PlayAudioEvent(audioUrl));
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    color: const Color(0xFF064439),
                    size: 32,
                  ),
                );
              },
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameEn,
                  style: const TextStyle(
                    color: Color(0xFF064439),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$versesCount آيات',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            Text(
              nameAr,
              style: const TextStyle(
                color: Color(0xFF064439),
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Amiri',
              ),
            ),
          ],
        ),
      ),
    );
  }
}