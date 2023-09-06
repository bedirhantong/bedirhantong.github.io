import 'package:bedirhantong_github_io/view/intro/components/subtitle_text.dart';
import 'package:flutter/material.dart';
import '../../../viewmodel/responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Responsive(
            desktop:
                AnimatedSubtitleText(start: 30, end: 40, text: 'Full Stack '),
            largeMobile:
                AnimatedSubtitleText(start: 30, end: 25, text: 'Full Stack '),
            mobile:
                AnimatedSubtitleText(start: 25, end: 20, text: 'Full Stack '),
            tablet:
                AnimatedSubtitleText(start: 40, end: 30, text: 'Full Stack '),
          ),
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(colors: [
                Colors.deepPurpleAccent,
                Colors.redAccent,
              ]).createShader(bounds);
            },
            child: const Responsive(
              desktop: AnimatedSubtitleText(
                  start: 30,
                  end: 40,
                  text: 'Mobile Developer',
                  gradient: false),
              largeMobile: AnimatedSubtitleText(
                  start: 30,
                  end: 25,
                  text: 'Mobile Developer',
                  gradient: false),
              mobile: AnimatedSubtitleText(
                  start: 25, end: 20, text: 'Mobile Developer', gradient: true),
              tablet: AnimatedSubtitleText(
                  start: 40,
                  end: 30,
                  text: 'Mobile Developer',
                  gradient: false),
            ),
          )
        ],
      ),
    );
  }
}
