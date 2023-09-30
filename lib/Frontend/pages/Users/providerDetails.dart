import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/Users/payment.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import '../../constant/widgets.dart';

class ProviderDetails extends StatelessWidget {
  const ProviderDetails({super.key});

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
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: const Image(
                  image: AssetImage(lawyer1),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                    ),
                    text: "Name: ",
                    children: [
                      WidgetSpan(
                        child: customTextWidget(
                          'Ajay Nagar',
                          16.0,
                          FontWeight.w500,
                          black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    customTextWidget(
                      '4.5',
                      16.0,
                      FontWeight.w500,
                      black,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20.0,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                ),
                text: "RegisteredId: : ",
                children: [
                  WidgetSpan(
                    child: customTextWidget(
                      'WBSTNPLCF562',
                      16.0,
                      FontWeight.w500,
                      black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                ),
                text: "Location:",
                children: [
                  WidgetSpan(
                    child: customTextWidget(
                      'Kolkata, Sec - I',
                      16.0,
                      FontWeight.w500,
                      black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                ),
                text: "Designation:",
                children: [
                  WidgetSpan(
                    child: customTextWidget(
                      'Lawyer',
                      16.0,
                      FontWeight.w500,
                      black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            customTextWidget(
              'Remark:',
              16.0,
              FontWeight.w500,
              green,
            ),
            customTextWidget(
              'Solved 10+ cases with 3 complex',
              16.0,
              FontWeight.w500,
              black,
            ),
            const SizedBox(height: 30.0),
            const Center(
              child: Text(
                "View reviews",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: green),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Payment(),
                  ));
                },
                child: customTextWidget(
                  "Pay & Book",
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
