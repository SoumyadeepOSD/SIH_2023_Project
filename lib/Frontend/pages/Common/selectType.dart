import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/Providers/selectCategories.dart';
import 'package:sih_2023/Frontend/pages/Users/homepage.dart';
import 'package:sih_2023/Frontend/pages/Users/testingImage.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';

class SelectTypes extends StatelessWidget {
  const SelectTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Select Type",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            customTextWidget("Choose yourself", 22.0, FontWeight.bold, black),
            const SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectCategories(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: customgrey, width: 1),
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 200,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Icon(
                        Icons.app_registration_rounded,
                        color: purple,
                        size: 50.0,
                      ),
                      customTextWidget(
                          "Register as Provider", 14.0, FontWeight.bold, black)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HomePage(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: customgrey, width: 1),
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 200,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Icon(
                        Icons.man,
                        color: blue,
                        size: 50.0,
                      ),
                      customTextWidget(
                          "Continue as user", 14.0, FontWeight.bold, black)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
