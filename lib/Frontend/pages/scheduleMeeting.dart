import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/payment.dart';
import 'package:sih_2023/Frontend/pages/subcategories.dart';
import '../constant/colors.dart';
import '../constant/images.dart';
import '../constant/widgets.dart';

class ScheduleBooking extends StatelessWidget {
  const ScheduleBooking({super.key});

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
          "Schedule Meeting",
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
            const SizedBox(height: 20.0),
            customTextWidget(
              "June, 17 Monday",
              30.0,
              FontWeight.bold,
              black,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  customContainer(date: "17", day: "Monday"),
                  customContainer(date: "18", day: "Tuesday"),
                  customContainer(date: "19", day: "Wednesday"),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            customTextWidget(
              "Schedule",
              30.0,
              FontWeight.bold,
              black,
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: customTextWidget(
                  "Put your meeting topic ... ",
                  15.0,
                  FontWeight.bold,
                  black,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
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
                  "Confirm",
                  16.0,
                  FontWeight.bold,
                  white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: red),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Payment(),
                  ));
                },
                child: customTextWidget(
                  "Cancel",
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

Widget customContainer({date, day}) {
  return Container(
    height: 50,
    width: 100,
    decoration: BoxDecoration(
        color: customgrey, borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: [
        customTextWidget(
          date,
          16.0,
          FontWeight.bold,
          white,
        ),
        customTextWidget(
          day,
          12.0,
          FontWeight.w500,
          white,
        ),
      ],
    ),
  );
}
