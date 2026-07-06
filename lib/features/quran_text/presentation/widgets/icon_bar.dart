import 'dart:ui';

import 'package:flutter/material.dart';

class IconsBar extends StatelessWidget {
  IconData icon;
   IconsBar({super.key,required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.9),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: const Color(0xFFD1FAE5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.03),
                blurRadius: 10,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xFF16A34A),
          ),
        ),
      ),
    );
  }
}
