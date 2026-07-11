import 'dart:ui';

import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
   SearchItem({super.key,required this.controller,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(28),
            border: Border.all(
              color: const Color(
                0xFFD1FAE5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF22C55E,
                ).withOpacity(.08),
                blurRadius: 20,
                offset:
                const Offset(
                  0,
                  10,
                ),
              ),
            ],
          ),
          child: TextFormField(
            cursorColor:Color(0xFF064E3B),
            controller: controller,
            onChanged: onChanged,
            style: const TextStyle(
              color: Color(0xFF064E3B),
              fontSize: 18,
            ),
            decoration:
            const InputDecoration(
              border:
              InputBorder.none,
              hintText:
              "ابحث عن سورة...",
              hintStyle:
              TextStyle(
                color: Color(
                  0xFF6EE7B7,
                ),
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color:
                Color(0xFF16A34A),
                size: 30,
              ),
              contentPadding:
              EdgeInsets.symmetric(
                vertical: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
