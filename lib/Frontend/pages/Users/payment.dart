import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/Users/providerDetailsCall.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import '../../constant/widgets.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

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
          "Payment",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height - 10,
          width: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Center(
                child: Image(
                  image: AssetImage(payment),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: green),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProviderDetailsCall(),
                    ));
                  },
                  child: customTextWidget(
                    "Confirm",
                    16.0,
                    FontWeight.bold,
                    white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
