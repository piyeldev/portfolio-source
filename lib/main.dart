import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'src/HomeScreenBody.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/NavBarItem.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'EduVICWANTBeginner'),
      debugShowCheckedModeBanner: false,
      title: "FrankyCraftrDev",
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color? appBarColor = Color.fromARGB(255, 40, 10, 175);
  Color? appBarForegroundColor = Color.fromARGB(255, 236, 236, 236);

  Future<void> launchUrlBrowser(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'cant launch urlString $url';
    }
  }

  Color? aboutNormalColor = Colors.white;
  void initState() {
    super.initState();

    if (Uri.base.toString() == 'https://frankycraftr.github.io/#/') {
      aboutNormalColor = Colors.lightBlue[600];
    } else {
      aboutNormalColor = Colors.white;
    }
  }

  Color normalColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 230, 230, 230),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              actions: [
                NavBarItem(
                  normalColor: aboutNormalColor,
                  selectedColor: Colors.white,
                  text: 'About',
                  onClick: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                NavBarItem(
                  normalColor: normalColor,
                  selectedColor: Colors.white,
                  text: 'Projects',
                  onClick: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                NavBarItem(
                  normalColor: normalColor,
                  selectedColor: Colors.white,
                  text: 'Courses',
                  onClick: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                NavBarItem(
                  normalColor: normalColor,
                  selectedColor: Colors.white,
                  text: 'Contact',
                  onClick: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                Tooltip(
                  message: 'View Source Code on Github',
                  child: IconButton(
                      onPressed: () {
                        print(Uri.base.toString());
                        launchUrlBrowser(
                            'https://github.com/FrankyCraftr/portfolio-source');
                      },
                      iconSize: 40,
                      color: Colors.black,
                      hoverColor: Colors.white,
                      icon: Icon(
                        FontAwesome5.github,
                        semanticLabel: 'View Source on Github',
                      )),
                ),
                const SizedBox(
                  width: 80,
                )
              ],
              title: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "FrankyCraftr",
                    style: GoogleFonts.nunito(fontSize: 30),
                  )
                ],
              ),
              backgroundColor: appBarColor,
              foregroundColor: appBarForegroundColor,
            ),
            body: const HomeScreenBody()));
  }
}
