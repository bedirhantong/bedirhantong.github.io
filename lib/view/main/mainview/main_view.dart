import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../theme/theme.dart';
import '../../../viewmodel/controller.dart';
import '../../../viewmodel/responsive.dart';
import '../components/navigation_bar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.pages});

  final List<Widget> pages;

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
        child: Center(
          child: Column(
            children: [
              kIsWeb && !Responsive.isLargeMobile(context)
                  ? const SizedBox(
                      height: defaultPadding * 1.2,
                    )
                  : const SizedBox(
                      height: defaultPadding / 1.2,
                    ),
              const SizedBox(
                height: 40,
                child: TopNavigationBar(),
              ),
              Expanded(
                flex: 12,
                child: PageView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [...pages],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
