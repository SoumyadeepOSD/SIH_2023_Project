import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import '../constant/colors.dart';

class PersonalAssistant extends StatelessWidget {
  const PersonalAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
            "Personal Assistant", 16.0, FontWeight.bold, white),
      ),
      body: const Column(
        children: [Center(child: Text("Implement Chatbot here"))],
      ),
    );
  }
}
