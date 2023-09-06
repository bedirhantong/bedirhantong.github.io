import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/blog_model/blog_model.dart';

class BlogLinks extends StatelessWidget {
  final int index;

  const BlogLinks({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        Row(
          children: [
            const Text('More detail',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis),
            IconButton(
                onPressed: () {
                  launchUrl(Uri.parse(blogList[index].link));
                },
                icon: SvgPicture.asset(blogList[index].logo)),
          ],
        ),
      ],
    );
  }
}
