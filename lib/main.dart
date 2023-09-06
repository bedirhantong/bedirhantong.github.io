import 'package:bedirhantong_github_io/theme/theme.dart';
import 'package:bedirhantong_github_io/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
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

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late SpinKitPouringHourGlassRefined spinkit;

  @override
  void initState() {
    super.initState();

    spinkit = const SpinKitPouringHourGlassRefined(
      color: Colors.black,
      size: 50.0,
    );

    Future.delayed(const Duration(seconds: 1), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(128, 139, 175, 1.0),
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
              style: GoogleFonts.nunito(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
