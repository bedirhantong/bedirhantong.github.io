import 'package:flutter/material.dart';

import '../../../viewmodel/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          'I am currently using both Flutter and Kotlin to develop ${Responsive.isLargeMobile(context) ? '\n' : ''}mobile applications ${!Responsive.isLargeMobile(context) ? '\n' : ''}and using .Net for backend. I am a 3rd year student at Akdeniz University.',
          maxLines: 15,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
        );
      },
    );
  }
}
