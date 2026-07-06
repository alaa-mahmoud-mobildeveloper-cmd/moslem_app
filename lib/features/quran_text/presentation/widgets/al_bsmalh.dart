import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoyalIslamicFrame extends StatelessWidget {
  final Widget child;

  const RoyalIslamicFrame({super.key, required this.child});

  final String svgString = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 120" width="100%" height="100%">
  <path d="M 55 15 
           L 445 15 
           C 470 15, 485 30, 495 60 
           C 485 90, 470 105, 445 105 
           L 55 105 
           C 30 105, 15 90, 5 60 
           C 15 30, 30 15, 55 15 Z" 
        fill="none" 
        stroke="#126B1E" 
        stroke-width="5.5"/>

  <path d="M 58 20 
           L 442 20 
           C 465 20, 478 33, 488 60 
           C 478 87, 465 100, 442 100 
           L 58 100 
           C 35 100, 22 87, 12 60 
           C 22 33, 35 20, 58 20 Z" 
        fill="none" 
        stroke="#126B1E" 
        stroke-width="2.2" 
        stroke-dasharray="4,3"/>

  <circle cx="32" cy="60" r="4.5" fill="#064439" />
  <circle cx="468" cy="60" r="4.5" fill="#064439" />
  
  <path d="M 40 48 Q 28 60 40 72" fill="none" stroke="#064439" stroke-width="1.8"/>
  <path d="M 460 48 Q 472 60 460 72" fill="none" stroke="#064439" stroke-width="1.8"/>
</svg>
''';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 12.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.string(
            svgString,
            fit: BoxFit.fill,
            width: double.infinity,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: child,
          ),
        ],
      ),
    );
  }
}