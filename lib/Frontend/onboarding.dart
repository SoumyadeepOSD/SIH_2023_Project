import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
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
              child: const Center(
                child: Text("Third"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
