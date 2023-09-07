import 'package:bedirhantong_github_io/view/projects/components/project_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/project_model/project_model.dart';
import '../../../res/constants.dart';
import '../../../viewmodel/getx_controller/project_controller.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;

  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});

  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        return Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.blueGrey,
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
