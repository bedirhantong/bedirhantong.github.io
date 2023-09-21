import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model/project_model.dart';
import '../../../viewmodel/responsive.dart';

class ProjectDetail extends StatelessWidget {
  final int index;

  const ProjectDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              projectList[index].name,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            IconButton(
                onPressed: () {
                  launchUrl(Uri.parse(projectList[index].link));
                },
                icon: SvgPicture.asset('assets/icons/github.svg')),
          ],
        ),
        Responsive.isLargeMobile(context)
            ? SizedBox(
                width: size.width * 0.6,
                height: size.height * 0.6,
                child: Image.asset(projectList[index].link),
              )
            : Responsive.isDesktop(context)
                ? SizedBox(
                    width: size.width * 0.2,
                    height: size.height * 0.73,
                    child: Image.asset(projectList[index].link),
                  )
                : Responsive.isMobile(context)
                    ? SizedBox(
                        width: size.width * 0.6,
                        height: size.height * 0.6,
                        child: Image.asset(projectList[index].link),
                      )
                    : Responsive.isTablet(context)
                        ? SizedBox(
                            width: size.width * 0.6,
                            height: size.height * 0.6,
                            child: Image.asset(projectList[index].link),
                          )
                        : SizedBox(
                            width: size.width * 0.6,
                            height: size.height * 0.6,
                            child: Image.asset(projectList[index].link),
                          )
      ],
    );
  }
}
