import 'package:flutter/material.dart';

class ContinueListeningCard extends StatelessWidget {
  final String surahName;
  final String readerName;
  final Duration currentPosition;
  final Duration totalDuration;
  final VoidCallback onPlay;

  const ContinueListeningCard({
    super.key,
    required this.surahName,
    required this.readerName,
    required this.currentPosition,
    required this.totalDuration,
    required this.onPlay,
  });

  double get progress {
    if (totalDuration.inSeconds == 0) return 0;
    return (currentPosition.inSeconds / totalDuration.inSeconds).clamp(0.0, 1.0);
  }

  String format(Duration d) {
    String two(int n) => n.toString().padLeft(2, "0");
    return "${two(d.inMinutes)}:${two(d.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff169B46),
            Color(0xff147C37),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff16A34A).withOpacity(.25),
            blurRadius: 35,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: Stack(
          children: [
            Positioned(
              right: -45,
              top: -45,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.06),
                ),
              ),
            ),
            Positioned(
              left: -55,
              bottom: -55,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffF4C542).withOpacity(.18),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 40,
              child: Opacity(
                opacity: .08,
                child:  Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffF4C542).withOpacity(.18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "استمر في الاستماع",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xffF4C542),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    surahName,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                      fontFamily: "Cairo",
                    ),
                  ),
                  Text(
                    readerName,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onPlay,
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffF4C542),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffF4C542).withOpacity(.35),
                                blurRadius: 15,
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            size: 38,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Container(
                                      height: 5,
                                      width: constraints.maxWidth * progress,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF4C542),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  format(currentPosition),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  format(totalDuration),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}