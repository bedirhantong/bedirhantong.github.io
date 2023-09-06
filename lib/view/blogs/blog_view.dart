import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../theme/theme.dart';
import '../../viewmodel/getx_controller/experience_controller.dart';
import '../../viewmodel/responsive.dart';
import 'components/blog_grid.dart';
import 'package:provider/provider.dart';

class BlogView extends StatelessWidget {
  BlogView({super.key});

  final controller = Get.put(BlogController());

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
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: const Center(
          child: Expanded(
            child: Responsive(
              desktop: BlogGrid(
                crossAxisCount: 1,
                ratio: 1.2,
              ),
              extraLargeScreen: BlogGrid(
                crossAxisCount: 1,
                ratio: 1.6,
              ),
              largeMobile: BlogGrid(crossAxisCount: 1, ratio: 1.8),
              mobile: BlogGrid(crossAxisCount: 1, ratio: 1.5),
              tablet: BlogGrid(
                ratio: 1.4,
                crossAxisCount: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
