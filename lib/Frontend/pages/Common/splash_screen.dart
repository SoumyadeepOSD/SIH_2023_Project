import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/Common/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            children: [
              // Image
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/supremeCourt.png",
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              // Image end
              // Text
              Positioned(
                left: MediaQuery.of(context).size.width * 0.25,
                top: MediaQuery.of(context).size.width * 1.6,
                child: Text(
                  'Bharat विधि',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 40, // Text size
                    fontWeight: FontWeight.bold, // Text font weight
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.25,
                top: MediaQuery.of(context).size.height * 0.2,
                child: Image(
                  image: AssetImage(
                    "assets/images/ashok.png",
                  ),
                  height: 180,
                  width: 180,
                ),
              ),
              // Linearbar
            ],
          ),
        ),
      ),
    );
  }
}
