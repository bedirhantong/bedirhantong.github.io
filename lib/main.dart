import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ),);
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode currentTheme() {
    return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeData getLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      hintColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        // Diğer stilleri değiştirmeye devam edin
        headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        bodyText1: TextStyle(fontSize: 16, color: Colors.black),
        bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
      // Diğer özellikleri de güncelleyebilirsiniz
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      hintColor: Colors.amber,
      scaffoldBackgroundColor: Colors.grey[900],
      textTheme: const TextTheme(
        // Diğer stilleri değiştirmeye devam edin
        headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText1: TextStyle(fontSize: 16, color: Colors.white),
        bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
      // Diğer özellikleri de güncelleyebilirsiniz
    );
  }


  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Bedirhan Tonğ',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode
          ? themeProvider.getDarkTheme()
          : themeProvider.getLightTheme(),
      home: const Splash(),
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          children: [
            Text(
              'Bedirhan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Tonğ',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          // TextButton(
          //   onPressed: () {
          //     controller.animateToPage(0,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut);
          //   },
          //   child: Text(
          //     'About Me',
          //     style: GoogleFonts.robotoMono(
          //       textStyle: const TextStyle(
          //           color: Colors.white, letterSpacing: .5, fontSize: 14),
          //     ),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {
          //     controller.animateToPage(1,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut);
          //   },
          //   child: Text(
          //     'Experience',
          //     style: GoogleFonts.robotoMono(
          //       textStyle: const TextStyle(
          //           color: Colors.white, letterSpacing: .5, fontSize: 14),
          //     ),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {
          //     controller.animateToPage(2,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut);
          //   },
          //   child: Text(
          //     'Projects',
          //     style: GoogleFonts.robotoMono(
          //       textStyle: const TextStyle(
          //           color: Colors.white, letterSpacing: .5, fontSize: 14),
          //     ),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {
          //     controller.animateToPage(3,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut);
          //   },
          //   child: Text(
          //     'Contact',
          //     style: GoogleFonts.robotoMono(
          //       textStyle: const TextStyle(
          //           color: Colors.white, letterSpacing: .5, fontSize: 14),
          //     ),
          //   ),
          // ),
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
            activeColor: Colors.blueGrey,
            inactiveTrackColor: Colors.amberAccent.shade700,
            inactiveThumbColor: Colors.transparent,
            activeThumbImage: const AssetImage('assets/images/moon.png'),
            inactiveThumbImage: const AssetImage('assets/images/sun.png'),
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        onPageChanged: (value) {
          setState(() {});
        },
        children: [
          const AboutPage(),
          const Experience(),
          const ProjectsPage(),
          ContactPage(),
          const ProjectCard(
            title: 'Personal Health Tracker',
            description: 'Soon it will be ready. Stay tuned!',
            githubLink:
                'https://github.com/bedirhantong/PersonalHealthTrackerApp',
            imageLink: 'https://www.linkpicture.com/q/Epona_Temp.png',
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.grey[900] : Colors.white70, // Arka plan rengini temaya göre ayarlayın
        body: Center(
          child: SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: MaterialTextSelectionControls(),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: screenSize.height * 0.12,
                    backgroundImage: const NetworkImage(
                        'https://avatars.githubusercontent.com/u/70720131?v=4'),
                  ),
                  Text(
                    'Hello, I am Bedirhan Tonğ',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          letterSpacing: .5,
                          fontSize: screenSize.width * 0.025,
                      ),
                    ),
                  ),
                  Text(
                    'Full Stack Mobile Application Developer',
                    style: GoogleFonts.robotoMono(
                      textStyle: TextStyle(
                          letterSpacing: .5,
                        fontSize: screenSize.width * 0.021,
                        color: themeProvider.isDarkMode ? Colors.amber.shade400 : Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'I am a 3rd year student at Akdeniz University.',
                    style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: screenSize.width * 0.011,
                      ),
                    ),
                  ),
                  Text(
                    'Interested in mobile application development.',
                    style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: screenSize.width * 0.011,
                      ),
                    ),
                  ),
                  Text(
                    'I am currently using both Flutter and Kotlin to develop mobile applications.',
                    style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: screenSize.width * 0.011,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset('assets/images/github_850.png'),),
                      IconButton(onPressed: (){}, icon: Image.asset('assets/images/linkedin_480.png'),),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '© Bedirhan Tonğ - 2023',
                    style: TextStyle(
                      letterSpacing: .5,
                      fontSize: screenSize.width * 0.009,
                      // color: Theme.of(context).textTheme.headline2.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

    );

    // return Stack(
    //   children: [
    //     Image.asset(
    //       'assets/gifs/projects.gif', // Görsel dosyasının yolunu düzenleyin
    //       fit: BoxFit.cover,
    //       width: double.infinity,
    //       height: double.infinity,
    //     ),
    //     Center(
    //       child: SelectableRegion(
    //         focusNode: FocusNode(),
    //         selectionControls: MaterialTextSelectionControls(),
    //         child: Wrap(
    //           alignment: WrapAlignment.center,
    //           crossAxisAlignment: WrapCrossAlignment.center,
    //           spacing: 16,
    //           children: [
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   'Hello, World! My name is',
    //                   style: GoogleFonts.robotoMono(
    //                     textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         letterSpacing: .5,
    //                         fontSize: 15),
    //                   ),
    //                 ),
    //                 Text(
    //                   'Bedirhan Tonğ',
    //                   style: GoogleFonts.anton(
    //                     textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         letterSpacing: .5,
    //                         fontSize: 60),
    //                   ),
    //                 ),
    //                 Text(
    //                   'Junior Software Developer',
    //                   style: GoogleFonts.robotoMono(
    //                     textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         letterSpacing: .5,
    //                         fontSize: 30),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 30,
    //                 ),
    //                 Text(
    //                   'I am a 3rd year student at Akdeniz University. \nInterested in mobile application development. \nI am currently using both Flutter and Kotlin to develop mobile applications.',
    //                   style: GoogleFonts.robotoMono(
    //                     textStyle: const TextStyle(
    //                         color: Colors.white,
    //                         letterSpacing: .5,
    //                         fontSize: 15),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             CircleAvatar(
    //               radius: screenSize.height * 0.15,
    //               backgroundImage: const NetworkImage(
    //                   'https://avatars.githubusercontent.com/u/70720131?v=4'),
    //             ),
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late SpinKitFoldingCube spinkit;

  @override
  void initState() {
    super.initState();

    spinkit = const SpinKitFoldingCube(
      color: Colors.black87,
      size: 50.0,
    );

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            spinkit,

            //Image.asset('assets/images/flutterlogo.png', width: 40, height: 40,),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Loading...",
              style: GoogleFonts.nunito(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'My experiences',
            style: GoogleFonts.robotoMono(
              textStyle: const TextStyle(
                  color: Colors.white, letterSpacing: .5, fontSize: 30),
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Mavi Arge',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
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
            'assets/gifs/projects.gif', // Görsel dosyasının yolunu düzenleyin
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProjectCard(
                    title: 'Personal Health Tracker',
                    description: 'Soon it will be ready. Stay tuned!',
                    githubLink:
                        'https://github.com/bedirhantong/PersonalHealthTrackerApp',
                    imageLink: '',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProjectCard(
                    title: 'Threads Clone',
                    description:
                        'A clone of the social media application Threads...',
                    githubLink: 'https://github.com/bedirhantong/threads_clone',
                    imageLink: '',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProjectCard(
                    title: 'QuizWiz',
                    description:
                        'Interactive Quizz App. A quiz app that allows you to test your knowledge in different categories.',
                    githubLink: 'https://github.com/bedirhantong/quizwiz',
                    imageLink: '',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String githubLink;
  final String imageLink;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.githubLink,
    required this.imageLink,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Uri url = Uri.parse('');
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.imageLink, // Görsel dosyasının yolunu düzenleyin
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Card(
            color: Colors.black45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
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
                  widget.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    url = Uri.parse(widget.githubLink);
                    setState(() {
                      launchUrl(url);
                    });
                    // Open the GitHub link here using launch()
                  },
                  child: const Text('Github'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);

  final String _email = 'bedirhantongdev@gmail.com';

  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: _email,
      queryParameters: {
        'subject': _subjectController.text,
        'body': _messageController.text,
      },
    );
    if (await canLaunchUrl(emailLaunchUri.toString() as Uri)) {
      await launchUrl(emailLaunchUri.toString() as Uri);
    } else {
      throw 'Could not launch email.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/gifs/game.gif', // Görsel dosyasının yolunu düzenleyin
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Contact me',
                style: TextStyle(color: Colors.white, fontSize: 20),
                selectionColor: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _subjectController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          label: Text(
                            "Subject",
                            style: TextStyle(color: Colors.white),
                          ),
                          hintText: "Subject",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _messageController,
                        maxLines: 5,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          label: Text(
                            "Message",
                            style: TextStyle(color: Colors.white),
                          ),
                          hintText: "Message",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _sendEmail();
                          }
                        },
                        child: const Text('Send Email'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
