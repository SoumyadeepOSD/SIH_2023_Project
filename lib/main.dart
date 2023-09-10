// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sih_2023/Frontend/pages/onboarding.dart';
import 'package:sih_2023/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIH 2023',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
