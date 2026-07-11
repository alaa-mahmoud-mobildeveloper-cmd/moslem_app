import 'package:flutter/material.dart';

class IslamicBackground extends StatelessWidget {
  final Widget child;

  const IslamicBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        /// Background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffF9FFF9),
                Color(0xffF3FCF5),
              ],
            ),
          ),
        ),

        /// Top Right Glow
        Positioned(
          top: -140,
          right: -120,
          child: Container(
            width: 340,
            height: 340,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff22C55E).withOpacity(.12),
            ),
          ),
        ),

        /// Bottom Left Glow
        Positioned(
          bottom: -170,
          left: -150,
          child: Container(
            width: 360,
            height: 360,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffD4AF37).withOpacity(.08),
            ),
          ),
        ),

        /// Islamic Pattern
        IgnorePointer(
          child: Opacity(
            opacity: .05,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 50,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (_, __) {
                return const Center(
                  child: Icon(
                    Icons.auto_awesome,
                    size: 70,
                    color: Color(0xff16A34A),
                  ),
                );
              },
            ),
          ),
        ),

        child,
      ],
    );
  }
}