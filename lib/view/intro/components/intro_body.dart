import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../viewmodel/responsive.dart';
import 'description_text.dart';
import 'headline_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            padding: const EdgeInsets.all(defaultPadding / 2.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Colors.deepPurple,
                Colors.blueGrey,
              ]),
              boxShadow: const [
                BoxShadow(
                  color: Colors.cyanAccent,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Colors.indigoAccent,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/me.jpg',
              height: Responsive.isLargeMobile(context)
                  ? MediaQuery.sizeOf(context).width * 0.2
                  : Responsive.isTablet(context)
                      ? MediaQuery.sizeOf(context).width * 0.14
                      : 200,
              width: Responsive.isLargeMobile(context)
                  ? MediaQuery.sizeOf(context).width * 0.2
                  : Responsive.isTablet(context)
                      ? MediaQuery.sizeOf(context).width * 0.14
                      : 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: Responsive.isDesktop(context)
                ? size.height * 0.01
                : size.height * 0.03,
          ),
          const Responsive(
              desktop: MyPortfolioText(start: 40, end: 50),
              largeMobile: MyPortfolioText(start: 40, end: 35),
              mobile: MyPortfolioText(start: 35, end: 30),
              tablet: MyPortfolioText(start: 50, end: 40)),
          // const CombineSubtitleText(),
          SizedBox(
            height: Responsive.isDesktop(context)
                ? size.height * 0.01
                : size.height * 0.03,
          ),
          const Responsive(
            desktop: AnimatedDescriptionText(start: 14, end: 15),
            largeMobile: AnimatedDescriptionText(start: 14, end: 12),
            mobile: AnimatedDescriptionText(start: 14, end: 12),
            tablet: AnimatedDescriptionText(start: 17, end: 14),
          ),
          const SizedBox(
            height: defaultPadding * 2,
          ),
        ],
      ),
    );
  }
}

// class IntroBody extends StatelessWidget {
//   const IntroBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.sizeOf(context);
//     return Row(
//       children: [
//         SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (!Responsive.isDesktop(context))
//                 SizedBox(
//                   height: size.height * 0.06,
//                 ),
//               if (!Responsive.isDesktop(context))
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: size.width * 0.23,
//                     ),
//                     const AnimatedImageContainer(
//                       width: 150,
//                       height: 200,
//                     ),
//                   ],
//                 ),
//               if (!Responsive.isDesktop(context))
//                 SizedBox(
//                   height: size.height * 0.1,
//                 ),
//               const Responsive(
//                   desktop: MyPortfolioText(start: 40, end: 50),
//                   largeMobile: MyPortfolioText(start: 40, end: 35),
//                   mobile: MyPortfolioText(start: 35, end: 30),
//                   tablet: MyPortfolioText(start: 50, end: 40)),
//               if (kIsWeb && Responsive.isLargeMobile(context))
//                 Container(
//                   height: defaultPadding,
//                   color: Colors.transparent,
//                 ),
//               const CombineSubtitleText(),
//               const SizedBox(height: defaultPadding / 2),
//               const Responsive(
//                 desktop: AnimatedDescriptionText(start: 14, end: 15),
//                 largeMobile: AnimatedDescriptionText(start: 14, end: 12),
//                 mobile: AnimatedDescriptionText(start: 14, end: 12),
//                 tablet: AnimatedDescriptionText(start: 17, end: 14),
//               ),
//               const SizedBox(
//                 height: defaultPadding * 2,
//               ),
//             ],
//           ),
//         ),
//         if (Responsive.isDesktop(context)) const Spacer(),
//         if (Responsive.isDesktop(context)) const AnimatedImageContainer(),
//         if (Responsive.isDesktop(context)) const Spacer()
//       ],
//     );
//   }
// }
