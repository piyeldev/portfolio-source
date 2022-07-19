import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'HomeScreenBody.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NavBarItem.dart';

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
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool onHover = false;
  Color appBarNotHoveredColor = Colors.transparent;
  Color appBarHoveredColor = Colors.black38;

  Color? appBarColor;
  Color? appBarForegroundColor;
  void appbaronHoverEffects(bool isHovered) => setState(() {
        onHover = isHovered;
        if (isHovered) {
          appBarColor = appBarHoveredColor;
        } else {
          appBarColor = appBarNotHoveredColor;
        }
      });

  Color? aboutItemsColor;
  Color? currentPageColor = Colors.white;
  bool aboutOnHover = false;
  void aboutHoverEffects(bool isHovered) => setState(() {
        aboutOnHover = isHovered;

        if (isHovered) {
          aboutItemsColor = Colors.white;
        } else {
          aboutItemsColor = const Color.fromRGBO(56, 135, 220, 1);
        }
      });

  Color? coursesItemsColor;
  bool coursesOnHover = false;
  void coursesHoverEffects(bool isHovered) => setState(() {
        coursesOnHover = isHovered;

        if (isHovered) {
          coursesItemsColor = Colors.white;
        } else {
          coursesItemsColor = const Color.fromRGBO(56, 135, 220, 1);
        }
      });

  Color? contactItemsColor;
  bool contactOnHover = false;
  void contactHoverEffects(bool isHovered) => setState(() {
        contactOnHover = isHovered;

        if (isHovered) {
          contactItemsColor = Colors.white;
        } else {
          contactItemsColor = const Color.fromRGBO(56, 135, 220, 1);
        }
      });

  Color? appsItemsColor;
  bool appstOnHover = false;
  void appsHoverEffects(bool isHovered) => setState(() {
        appstOnHover = isHovered;

        if (isHovered) {
          appsItemsColor = Colors.white;
        } else {
          appsItemsColor = const Color.fromRGBO(56, 135, 220, 1);
        }
      });
  Color? githubLogoItemColor;
  bool githubLogoOnHover = false;
  void githubHoverEffects(bool isHovered) => setState(() {
        githubLogoOnHover = isHovered;

        if (isHovered) {
          githubLogoItemColor = Colors.white;
        } else {
          githubLogoItemColor = const Color.fromRGBO(56, 135, 220, 1);
        }
      });
  void initState() {
    super.initState();
    appBarColor = Colors.transparent;
    appBarForegroundColor = const Color.fromARGB(255, 4, 18, 179);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(16, 20, 20, 1),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: MouseRegion(
              onEnter: ((event) => appbaronHoverEffects(true)),
              onExit: ((event) => appbaronHoverEffects(false)),
              child: AppBar(
                actions: [
                  NavBarItem(
                    normalColor: const Color.fromRGBO(56, 135, 220, 1),
                    selectedColor: Colors.white,
                    text: 'About',
                    onClick: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  NavBarItem(
                    normalColor: const Color.fromRGBO(56, 135, 220, 1),
                    selectedColor: Colors.white,
                    text: 'Projects',
                    onClick: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  NavBarItem(
                    normalColor: const Color.fromRGBO(56, 135, 220, 1),
                    selectedColor: Colors.white,
                    text: 'Courses',
                    onClick: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  NavBarItem(
                    normalColor: const Color.fromRGBO(56, 135, 220, 1),
                    selectedColor: Colors.white,
                    text: 'Contact',
                    onClick: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MouseRegion(
                    onEnter: (event) => githubHoverEffects(true),
                    onExit: (event) => githubHoverEffects(false),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesome5.github,
                          size: 30,
                          color: githubLogoItemColor,
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
                shadowColor: Colors.transparent,
              ),
            ),
          ),
          body: const HomeScreenBody()),
    );
  }
}
