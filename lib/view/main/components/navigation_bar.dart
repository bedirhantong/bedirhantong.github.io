import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../viewmodel/responsive.dart';
import 'navigation_button_list.dart';
import 'package:provider/provider.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Responsive.isLargeMobile(context)
                ? const Spacer(
                    flex: 3,
                  )
                : const Spacer(
                    flex: 2,
                  ),
            const NavigationButtonList(),
            const Spacer(
              flex: 1,
            ),
            Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.amberAccent.shade700,
              inactiveThumbColor: Colors.transparent,
              activeThumbImage: const AssetImage('assets/images/moon.png'),
              inactiveThumbImage: const AssetImage('assets/images/sun.png'),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
