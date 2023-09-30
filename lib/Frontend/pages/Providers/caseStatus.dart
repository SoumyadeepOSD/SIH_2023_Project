import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';

class calendeclass {
  String day;
  String numbers;
  calendeclass({required this.day, required this.numbers});
}

List<calendeclass> calList = [
  calendeclass(day: "Monday", numbers: "18"),
  calendeclass(day: "Tuesday", numbers: "19"),
  calendeclass(day: "Wednesday", numbers: "20"),
  calendeclass(day: "Thursday", numbers: "21"),
  calendeclass(day: "Friday", numbers: "22"),
  calendeclass(day: "Saturday", numbers: "23"),
  calendeclass(day: "Sunday", numbers: "24"),
];

class CaseStatus extends StatelessWidget {
  const CaseStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              customTextWidget("Case Status", 20.0, FontWeight.bold, black),
              const SizedBox(height: 20.0),
              customTextWidget("Next Hearing", 14.0, FontWeight.bold, black),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: calList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0), // Adjust the spacing as needed
                      child: calendercard(
                        numbers: calList[index].numbers,
                        day: calList[index].day,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: 500,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    TimelineTile(
                      isFirst: true,
                      isLast: false,
                      beforeLineStyle: LineStyle(color: blue),
                      indicatorStyle: IndicatorStyle(
                        color: green,
                        iconStyle:
                            IconStyle(iconData: Icons.done, color: white),
                      ),
                      endChild: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: customTextWidget(
                            "Done first payment", 14.0, FontWeight.bold, black),
                      ),
                    ),
                    TimelineTile(
                      isFirst: false,
                      isLast: false,
                      beforeLineStyle: LineStyle(color: blue),
                      indicatorStyle: IndicatorStyle(
                        color: green,
                        iconStyle:
                            IconStyle(iconData: Icons.done, color: white),
                      ),
                      endChild: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: customTextWidget("Uploaded xerox copy of docs",
                            14.0, FontWeight.bold, black),
                      ),
                    ),
                    TimelineTile(
                      isFirst: false,
                      isLast: false,
                      beforeLineStyle: LineStyle(color: blue),
                      indicatorStyle: IndicatorStyle(
                        color: green,
                        iconStyle:
                            IconStyle(iconData: Icons.done, color: white),
                      ),
                      endChild: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: customTextWidget("Get approved by Magistrate",
                            14.0, FontWeight.bold, black),
                      ),
                    ),
                    TimelineTile(
                      isFirst: false,
                      isLast: false,
                      beforeLineStyle: LineStyle(color: blue),
                      indicatorStyle: IndicatorStyle(
                        color: green,
                        iconStyle:
                            IconStyle(iconData: Icons.done, color: white),
                      ),
                      endChild: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: customTextWidget("Submitted to lawyer", 14.0,
                            FontWeight.bold, black),
                      ),
                    ),
                    TimelineTile(
                      isFirst: false,
                      isLast: false,
                      afterLineStyle: LineStyle(color: Colors.blue.shade100),
                      beforeLineStyle: LineStyle(color: Colors.blue.shade100),
                      indicatorStyle: IndicatorStyle(
                        color: red,
                        iconStyle: IconStyle(
                            iconData: Icons.cancel, color: white, fontSize: 20),
                      ),
                      endChild: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: customTextWidget(
                            "Second payment", 14.0, FontWeight.bold, black),
                      ),
                    ),
                    TimelineTile(
                      isFirst: false,
                      isLast: false,
                      afterLineStyle: LineStyle(color: Colors.blue.shade100),
                      beforeLineStyle: LineStyle(color: Colors.blue.shade100),
                      indicatorStyle: IndicatorStyle(
                        color: red,
                        iconStyle: IconStyle(
                            iconData: Icons.cancel, color: white, fontSize: 20),
                      ),
                      endChild: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: customTextWidget(
                            "Show original docs", 14.0, FontWeight.bold, black),
                      ),
                    ),
                    TimelineTile(
                      isFirst: false,
                      isLast: true,
                      beforeLineStyle: LineStyle(color: Colors.blue.shade100),
                      indicatorStyle: IndicatorStyle(
                        color: red,
                        iconStyle: IconStyle(
                            iconData: Icons.cancel, color: white, fontSize: 20),
                      ),
                      endChild: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: customTextWidget(
                            "Submit xerox copy of income tax certificate",
                            14.0,
                            FontWeight.bold,
                            black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: green),
                  onPressed: () {},
                  child: customTextWidget(
                    "Submit",
                    14.0,
                    FontWeight.bold,
                    white,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

Widget calendercard({numbers, day}) {
  return Container(
    decoration: BoxDecoration(
      color: day == 'Wednesday' ? green : lightGrey,
      borderRadius: BorderRadius.circular(
        20.0,
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customTextWidget(numbers, 18.0, FontWeight.bold, black),
        customTextWidget(day, 12.0, FontWeight.bold, black),
      ],
    ),
  );
}
