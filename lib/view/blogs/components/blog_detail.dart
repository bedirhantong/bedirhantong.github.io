import 'package:flutter/material.dart';

import '../../../model/blog_model/blog_model.dart';
import '../../../res/constants.dart';
import '../../../viewmodel/responsive.dart';

class BlogDetail extends StatelessWidget {
  final int index;

  const BlogDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Responsive.isMobile(context)
            ? const SizedBox(
                height: defaultPadding / 2,
              )
            : const SizedBox(
                height: defaultPadding,
              ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            blogList[index].description,
            style: const TextStyle(color: Colors.grey, height: 1.2),
            maxLines: size.width > 700 && size.width < 750
                ? 3
                : size.width < 470
                    ? 2
                    : size.width > 600 && size.width < 700
                        ? 6
                        : size.width > 900 && size.width < 1060
                            ? 6
                            : 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Responsive.isMobile(context)
            ? const SizedBox(
                height: defaultPadding / 2,
              )
            : const SizedBox(
                height: defaultPadding,
              ),
      ],
    );
  }
}
