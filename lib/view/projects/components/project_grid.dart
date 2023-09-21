import 'package:bedirhantong_github_io/view/projects/components/project_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/project_model/project_model.dart';
import '../../../res/constants.dart';
import '../../../viewmodel/getx_controller/project_controller.dart';
import '../../../viewmodel/responsive.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;

  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 0.572});

  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: Responsive.isLargeMobile(context)
            ? size.aspectRatio * 0.98
            : Responsive.isDesktop(context)
                ? size.aspectRatio * 0.267
                : Responsive.isTablet(context)
                    ? size.aspectRatio * 0.56
                    : Responsive.isMobile(context)
                        ? 0.86
                        : size.aspectRatio * 0.58,
      ),
      itemBuilder: (context, index) {
        return Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent,
                  offset: const Offset(-2, 0),
                  blurRadius: controller.hovers[index] ? 20 : 10,
                ),
                BoxShadow(
                  color: Colors.cyanAccent,
                  offset: const Offset(2, 0),
                  blurRadius: controller.hovers[index] ? 20 : 10,
                ),
              ],
            ),
            child: ProjectStack(index: index),
          ),
        );
      },
    );
  }
}
