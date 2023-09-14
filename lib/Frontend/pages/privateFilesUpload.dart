import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/providersInfoRegister.dart';
import '../constant/colors.dart';
import '../constant/images.dart';
import '../constant/widgets.dart';

class PrivateFilesUpload extends StatelessWidget {
  const PrivateFilesUpload({super.key});

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
          "Upload files",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: const Image(
                image: AssetImage(
                  imageUpload,
                ),
              ),
            ),
            customTextWidget(
              "Select Your Preferences",
              20.0,
              FontWeight.bold,
              black,
            ),
            const SizedBox(height: 60.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: green),
                onPressed: () {},
                child: customTextWidget(
                  "Submit",
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
