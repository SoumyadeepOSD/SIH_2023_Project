import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/providersInfoRegister.dart';
import '../constant/colors.dart';
import '../constant/images.dart';
import '../constant/widgets.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

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
          "Legal इनोवेटर्स",
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
            const Image(
              image: AssetImage(
                libra,
              ),
            ),
            customTextWidget(
              "Select Your Preferences",
              20.0,
              FontWeight.bold,
              black,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProvidersInfoRegister(),
                  ),
                );
              },
              child: customTextWidget(
                "Provider",
                16.0,
                FontWeight.bold,
                black,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: customTextWidget(
                "User",
                16.0,
                FontWeight.bold,
                black,
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: green),
                onPressed: () {},
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
