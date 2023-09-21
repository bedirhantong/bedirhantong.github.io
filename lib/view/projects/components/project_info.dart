import 'package:bedirhantong_github_io/view/projects/components/project_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model/project_model.dart';
import '../../../res/constants.dart';
import '../../../theme/theme.dart';
import '../../../viewmodel/getx_controller/project_controller.dart';

class ProjectStack extends StatelessWidget {
  final controller = Get.put(ProjectController());

  ProjectStack({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
        launchUrl(Uri.parse(projectList[index].projectWebSite));
      },
      child: Container(
        // padding: const EdgeInsets.only(
        //     left: defaultPadding, right: defaultPadding, top: defaultPadding/5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: themeProvider.isDarkMode ? Colors.black : bgColor),
        child: ProjectDetail(
          index: index,
        ),
      ),
    );
  }
}
