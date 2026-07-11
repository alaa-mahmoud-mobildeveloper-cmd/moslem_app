import 'package:flutter/material.dart';

class AudioHeader extends StatelessWidget {
  const AudioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216,
      child: Stack(
        children: [

          Positioned(
            right: -70,
            top: -70,
            child: Container(
              width: 230,
              height: 230,
              decoration: const BoxDecoration(
                color: Color(0xffC9F7D5),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [

                const SizedBox(height: 12),

                Row(
                  children: [

                    _circleButton(
                      Icons.menu,
                      true,
                    ),

                    const Spacer(),

                    _circleButton(
                      Icons.notifications_none,
                      false,
                    ),

                    const SizedBox(width: 12),

                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xffE8FFF0),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xff16A34A),
                          width: 3,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "م",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff16A34A),
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                const Text(
                  "بسم الله الرحمن الرحيم",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff556B5D),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "الاستماع إلى القرآن",
                  style: TextStyle(
                    fontSize: 39,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Cairo",
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "اختر سورة واستمتع بتلاوة خاشعة",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff556B5D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(
      IconData icon,
      bool green,
      ) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: green
            ? const Color(0xff16A34A)
            : Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: green
            ? Colors.white
            : Colors.black87,
      ),
    );
  }
}