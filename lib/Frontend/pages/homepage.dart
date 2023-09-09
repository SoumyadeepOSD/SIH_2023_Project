import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'assistant.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("Love")),
    const Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          title: customTextWidget(
            "App Name",
            16.0,
            FontWeight.bold,
            white,
          ),
        ),
        // bottom navigation bar
        bottomNavigationBar: GNav(
          backgroundColor: black,
          gap: 5,
          color: white,
          activeColor: white,
          tabBackgroundColor: transparentblue,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.favorite_outline_outlined,
              text: "Favorites",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
            )
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PersonalAssistant(),
            ),
          ),
          backgroundColor: black,
          child: Icon(
            Icons.hail_outlined,
            color: white,
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
