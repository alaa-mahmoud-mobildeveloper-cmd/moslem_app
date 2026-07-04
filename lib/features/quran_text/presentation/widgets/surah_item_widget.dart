import 'package:flutter/material.dart';

class SurahItemWidgetCard extends StatelessWidget {
  final int number;
  final String nameAr;
  final String nameEn;
  final String versesCount;

  final VoidCallback onTap;

  const SurahItemWidgetCard({
    super.key,
    required this.number,
    required this.nameAr,
    required this.nameEn,
    required this.versesCount,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF064439).withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.star_outline, color: Color(0xFFD4AF37), size:50),
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
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),

              ],
            ),
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