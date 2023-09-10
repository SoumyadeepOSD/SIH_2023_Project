import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/images.dart';

import '../../constant/widgets.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              customTextWidget("Signup", 50.0, FontWeight.bold, black),
              const SizedBox(
                height: 30.0,
              ),
              customTextField(
                  controllerName: _emailController,
                  hint: "Enter your email",
                  icon: Icons.email),
              const SizedBox(
                height: 10.0,
              ),
              customTextField(
                  controllerName: _passwordController,
                  hint: "Enter your password",
                  icon: Icons.remove_red_eye),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                ),
                onPressed: () {},
                child: customTextWidget("Signup", 20.0, FontWeight.w500, white),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Already have an account?",
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    customTextWidget("Or", 20.0, FontWeight.w500, black),
                    Chip(
                      label: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTextWidget(
                                "Signin with", 16.0, FontWeight.bold, black),
                            const Image(
                              height: 20.0,
                              width: 20.0,
                              image: AssetImage(
                                googleLogo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
