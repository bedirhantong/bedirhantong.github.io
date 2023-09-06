import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../viewmodel/responsive.dart';
import 'components/intro_body.dart';
import 'components/social_media_list.dart';
import 'package:provider/provider.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              themeProvider.isDarkMode
                  ? Colors.black12
                  : Colors.deepPurpleAccent,
              themeProvider.isDarkMode ? Colors.black : Colors.black12,
            ],
          ),
        ),
        child: Row(
          children: [
            Responsive.isLargeMobile(context)
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.02,
                  )
                : SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.05,
                  ),
            const SocialMediaIconList(),
            Responsive.isLargeMobile(context)
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.02,
                  )
                : SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.05,
                  ),
            const Expanded(
              child: IntroBody(),
            ),
            Responsive.isLargeMobile(context)
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.03,
                  )
                : SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.15,
                  ),
          ],
        ),
      ),
    );
  }
}
