import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sih_2023/Frontend/pages/firstTab.dart';
import 'package:sih_2023/Frontend/pages/fourthTab.dart';
import 'package:sih_2023/Frontend/pages/providerRegister.dart';
import 'package:sih_2023/Frontend/pages/secondTab.dart';
import 'package:sih_2023/Frontend/pages/thirdTab.dart';
import 'assistant.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const FirstTab(),
    const SecondTab(),
    const ThirdTab(),
    const FourthTab()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          title: customTextWidget(
            "Bharat विधि",
            16.0,
            FontWeight.bold,
            white,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.file_copy_outlined,
                color: white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: white,
              ),
              onPressed: () {},
            )
          ],
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
              icon: Icons.info,
              text: "Settings",
            )
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RegisterProvider(),
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
