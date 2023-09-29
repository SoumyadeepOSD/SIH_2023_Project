import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import '../../constant/widgets.dart';
import '../Users/firstTab.dart';
import '../Models/usermodel.dart';

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _locationController = TextEditingController();
TextEditingController _registerIdController = TextEditingController();
TextEditingController _phoneNameController = TextEditingController();

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  customTextWidget("Register", 20.0, FontWeight.bold, blue),
                  const SizedBox(
                    height: 30.0,
                  ),
                  myCustomTextfield(
                      controllerName: _firstNameController,
                      hint: "Enter First Name"),
                  const SizedBox(
                    height: 20.0,
                  ),
                  myCustomTextfield(
                      controllerName: _lastNameController,
                      hint: "Enter last Name"),
                  const SizedBox(
                    height: 20.0,
                  ),
                  myCustomTextfield(
                      controllerName: _locationController,
                      hint: "Enter your address"),
                  const SizedBox(
                    height: 20.0,
                  ),
                  myCustomTextfield(
                    controllerName: _registerIdController,
                    hint: "Enter registeredID",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  myCustomTextfield(
                    controllerName: _phoneNameController,
                    hint: "Enter mobile Number",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final firstName = _firstNameController.text;
                      final lastName = _lastNameController.text;
                      final location = _locationController.text;
                      final registerId = _registerIdController.text;
                      final phoneName = _phoneNameController.text;

                      final user = UserModel(
                          firstName: firstName,
                          lastName: lastName,
                          location: location,
                          registerId: registerId,
                          phoneName: phoneName);
                      createUser(user);
                      const CircularProgressIndicator();
                      if (firstName != null &&
                          lastName != null &&
                          location != null &&
                          registerId != null &&
                          phoneName != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const FirstTab(),
                          ),
                        );
                      }
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildUser(UserModel user) {
  String timePeriod = getTimePeriod();
  return customTextWidget(
      'Welcome back ${user.firstName}', 20.0, FontWeight.bold, black);
}

Stream<List<UserModel>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

Stream<List<DistributorModel>> readProviders() => FirebaseFirestore.instance
    .collection('providers')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => DistributorModel.fromJson(doc.data()))
        .toList());

Future createUser(UserModel user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}

String getTimePeriod() {
  DateTime now = DateTime.now();
  int hour = now.hour;

  if (hour >= 5 && hour < 12) {
    return "Morning";
  } else if (hour >= 12 && hour < 17) {
    return "Afternoon";
  } else if (hour >= 17 && hour < 21) {
    return "Evening";
  } else {
    return "Night";
  }
}
