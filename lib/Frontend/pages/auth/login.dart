import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import 'package:sih_2023/Frontend/pages/auth/signup.dart';
import 'package:sih_2023/Frontend/pages/Users/homepage.dart';
import 'package:sih_2023/Frontend/pages/Common/languageSelection.dart';
import 'package:sih_2023/Frontend/pages/Common/register.dart';
import 'package:sih_2023/main.dart';
import '../../constant/widgets.dart';
import '../Models/usermodel.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<UserModel>>(
          stream: readUsers(),
          builder: (context, datasnapshot) {
            if (datasnapshot.hasError) {
              return const Text('Something went wrong!');
            } else if (datasnapshot.hasData) {
              return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : snapshot.hasError
                        ? const Center(
                            child: Text('Something went wrong!'),
                          )
                        : snapshot.hasData
                            ? HomePage()
                            : SafeArea(
                                child: SingleChildScrollView(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        customTextWidget("Sign-in", 50.0,
                                            FontWeight.bold, black),
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
                                            // signIn(context: context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LanguageSelection(),
                                              ),
                                            );
                                          },
                                          child: customTextWidget("Login", 20.0,
                                              FontWeight.w500, white),
                                        ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  text:
                                                      "Don't have an account?",
                                                  children: [
                                                    WidgetSpan(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const Signup(),
                                                            ),
                                                          );
                                                        },
                                                        child: customTextWidget(
                                                          "Signup",
                                                          16.0,
                                                          FontWeight.bold,
                                                          blue,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              customTextWidget("Or", 20.0,
                                                  FontWeight.w500, black),
                                              Chip(
                                                label: SizedBox(
                                                  width: 120,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      customTextWidget(
                                                          "Signup with",
                                                          16.0,
                                                          FontWeight.bold,
                                                          black),
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
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Future signIn({context}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  } on FirebaseAuthException catch (e) {
    print(e);
  }
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
