import 'package:flutter/material.dart';

import '../blogs/blog_view.dart';
import '../intro/introduction.dart';
import '../main/mainview/main_view.dart';
import '../projects/project_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(
      pages: [
        const Introduction(),
        ProjectsView(),
        BlogView(),
      ],
    );
  }
}
