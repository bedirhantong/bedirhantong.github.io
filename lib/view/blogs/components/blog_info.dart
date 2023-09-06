import 'package:bedirhantong_github_io/viewmodel/getx_controller/experience_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/blog_model/blog_model.dart';
import 'blog_detail.dart';

class BlogStack extends StatelessWidget {
  final controller = Get.put(BlogController());

  BlogStack({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
        launchUrl(Uri.parse(blogList[index].link));
      },
      borderRadius: BorderRadius.circular(30),
      child: BlogDetail(
        index: index,
      ),
    );
  }
}
