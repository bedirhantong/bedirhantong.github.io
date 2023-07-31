import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bedirhan Tonğ',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.animateToPage(0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut);
            },
            child: const Text(
              'About Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              controller.animateToPage(1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut);
            },
            child: const Text(
              'Projects',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Contact',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          setState(() {});
        },
        children: const [
          AboutPage(),
          ProjectsPage(),
        ],
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/gifs/projects.gif', // Görsel dosyasının yolunu düzenleyin
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 200.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bedirhan Tonğ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Junior Software Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Soon it will be ready. Stay tuned!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      // fontWeight: FontWeight,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton.outlined(
                        onPressed: () {
                          setState(() {
                            _url = Uri.parse('https://github.com/bedirhantong');
                            _launchUrl();
                          });
                        },
                        icon: Image.asset(
                          'assets/images/github_850.png',
                          color: Colors.white,
                        ),
                      ),
                      IconButton.outlined(
                        onPressed: () {
                          setState(() {
                            _url = Uri.parse(
                                'https://www.linkedin.com/in/tngbedirhan/');
                            _launchUrl();
                          });
                        },
                        icon: Image.asset(
                          'assets/images/linkedin_480.png',
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/70720131?v=4'),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/gifs/go.gif', // Görsel dosyasının yolunu düzenleyin
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Row(
            children: [
              Expanded(
                child: ProjectCard(
                  title: 'Personal Health Tracker',
                  description: 'Soon it will be ready. Stay tuned!',
                  githubLink:
                      'https://github.com/bedirhantong/personal_health_tracker',
                ),
              ),
              Expanded(
                child: ProjectCard(
                  title: 'Threads Clone',
                  description:
                      'A clone of the social media application Threads...',
                  githubLink: 'https://github.com/bedirhantong/threads_clone',
                ),
              ),
              Expanded(
                child: ProjectCard(
                  title: 'Barista App',
                  description:
                      'This is an interactive application that teaches users...',
                  githubLink: 'https://github.com/bedirhantong/barista_app',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String githubLink;

  const ProjectCard({
    required this.title,
    required this.description,
    required this.githubLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              // Open the GitHub link here using launch()
              launchUrl(githubLink as Uri);
            },
            child: const Text('Github'),
          ),
        ],
      ),
    );
  }
}
