import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih_2023/Frontend/pages/auth/signup.dart';
import 'package:sih_2023/Frontend/pages/homepage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = true;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            Container(
              color: Colors.red,
              child: const Center(
                child: Text("First"),
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text("Second"),
              ),
            ),
            Container(
              color: Colors.green,
              child: Center(
                child: Column(
                  children: [
                    const Text("Third"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Started",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
