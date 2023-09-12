import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import 'package:sih_2023/main.dart';
import '../../constant/utils.dart';
import '../../constant/widgets.dart';
import 'login.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                    flag: 0,
                    icon: Icons.email),
                const SizedBox(
                  height: 10.0,
                ),
                customTextField(
                    controllerName: _passwordController,
                    hint: "Enter your password",
                    flag: 1,
                    icon: Icons.remove_red_eye),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                  ),
                  onPressed: () {
                    signUp(context: context);
                  },
                  child:
                      customTextWidget("Signup", 20.0, FontWeight.w500, white),
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
                            WidgetSpan(
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                ),
                                child: customTextWidget(
                                  "Login",
                                  16.0,
                                  FontWeight.bold,
                                  blue,
                                ),
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
        ),
      ),
    );
  }
}

Future signUp({context}) async {
  final isValid = formKey.currentState!.validate();
  if (!isValid) return;
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  } on FirebaseAuthException catch (e) {
    print(e);
    Utils.showSnackBar(e.message);
  }

  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
