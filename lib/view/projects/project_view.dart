import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../theme/theme.dart';
import '../../viewmodel/getx_controller/project_controller.dart';
import '../../viewmodel/responsive.dart';
import 'components/project_grid.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});

  final controller = Get.put(ProjectController());

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
        // width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            if (Responsive.isLargeMobile(context))
              const SizedBox(
                height: defaultPadding / 3,
              ),
            Expanded(
              child: Responsive(
                desktop: ProjectGrid(
                  crossAxisCount: 3,
                ),
                extraLargeScreen: ProjectGrid(
                  crossAxisCount: 4,
                ),
                largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                tablet: ProjectGrid(
                  ratio: 1.4,
                  crossAxisCount: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
