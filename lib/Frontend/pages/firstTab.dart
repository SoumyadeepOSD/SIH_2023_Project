import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import 'package:sih_2023/Frontend/pages/auth/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/Frontend/pages/register.dart';
import 'package:sih_2023/Frontend/pages/serviceProviders.dart';
import 'package:sih_2023/Frontend/pages/usermodel.dart';
import 'package:sih_2023/testingImage.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: StreamBuilder<List<UserModel>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return Container(
              height: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView(
                      children: users.map(buildUser).toList(),
                    ),
                  ),
                  Column(
                    children: [
                      customTextWidget(
                          user.email, 16.0, FontWeight.bold, black),
                      ElevatedButton(
                        onPressed: () {
                          logout(context: context);
                        },
                        child: const Text("Logout"),
                      ),
                      // View all providers
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TestingImage(),
                            ),
                          );
                        },
                        child: const Text("View Providers"),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future logout({context}) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const Login(),
    ),
  );
}
