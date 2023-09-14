import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/selectCategories.dart';

import '../constant/colors.dart';
import '../constant/images.dart';
import '../constant/widgets.dart';

TextEditingController _controller = TextEditingController();

class ProvidersInfoRegister extends StatelessWidget {
  const ProvidersInfoRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Provider Details",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            customTextWidget(
              "Fill your details",
              20.0,
              FontWeight.bold,
              black,
            ),
            const SizedBox(height: 20.0),
            customTextField(
                controllerName: _controller, hint: "Enter your name"),
            const SizedBox(height: 20.0),
            customTextField(
                controllerName: _controller, hint: "Enter your phone number"),
            const SizedBox(height: 20.0),
            customTextField(
                controllerName: _controller, hint: "Enter your email"),
            const SizedBox(height: 20.0),
            customTextField(
                controllerName: _controller, hint: "Enter your Experience"),
            const SizedBox(height: 40.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: green),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SelectCategories(),
                  ));
                },
                child: customTextWidget(
                  "Continue",
                  16.0,
                  FontWeight.bold,
                  white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
