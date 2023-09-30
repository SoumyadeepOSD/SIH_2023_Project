import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sih_2023/Frontend/pages/Common/appSettings.dart';
import 'package:sih_2023/Frontend/pages/Common/assistant.dart';
import 'package:sih_2023/Frontend/pages/Providers/caseStatus.dart';
import 'package:sih_2023/Frontend/pages/Users/firstTab.dart';
import 'package:sih_2023/Frontend/pages/Users/fourthTab.dart';
import 'package:sih_2023/Frontend/pages/Users/privateFilesUpload.dart';
import 'package:sih_2023/Frontend/pages/Users/secondTab.dart';

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
    const PersonalAssistant(),
    const CaseStatus()
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivateFilesUpload(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppSettings(),
                  ),
                );
              },
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
              icon: Icons.question_answer,
              text: "Ask",
            ),
            GButton(
              icon: Icons.info,
              text: "Case\nStatus",
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
            Icons.report,
            color: white,
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
