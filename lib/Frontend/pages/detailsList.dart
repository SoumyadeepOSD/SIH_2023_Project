// ignore_for_file: must_be_immutable
import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/sliders/sliderPage.dart';
import '../constant/colors.dart';
import '../constant/widgets.dart';

class DetailsList extends StatelessWidget {
  String? firstName;
  String? lastName;
  String? location;
  String? type;
  String? registerId;
  String? phoneNumber;
  String? image;

  DetailsList({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.registerId,
    required this.phoneNumber,
    required this.image,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
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
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: Image.network(
                  image!,
                  width: 170.0,
                  height: 170.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                                '${firstName!}  ${lastName!}',
                                16.0,
                                FontWeight.w500,
                                black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                      ),
                      text: "Location: ",
                      children: [
                        WidgetSpan(
                          child: customTextWidget(
                            location!,
                            16.0,
                            FontWeight.w500,
                            black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0,
                          ),
                          text: "Registered Id: ",
                          children: [
                            WidgetSpan(
                              child: customTextWidget(
                                registerId!,
                                16.0,
                                FontWeight.w500,
                                black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(
                              50.0,
                            ),
                          ),
                          child: Icon(
                            Icons.done_outlined,
                            color: white,
                            size: 20,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                      ),
                      text: "Mobile: ",
                      children: [
                        WidgetSpan(
                          child: customTextWidget(
                            phoneNumber!,
                            16.0,
                            FontWeight.w500,
                            black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                      ),
                      text: "Designation: ",
                      children: [
                        WidgetSpan(
                          child: customTextWidget(
                            type!,
                            16.0,
                            FontWeight.w900,
                            green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                      ),
                      text: "",
                      children: [
                        WidgetSpan(
                          child: Row(
                            children: [
                              customTextWidget(
                                '4.5',
                                16.0,
                                FontWeight.w900,
                                green,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  customTextWidget(
                    "Testimonials",
                    14.0,
                    FontWeight.w500,
                    Colors.grey.shade800,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BuildCard(name: "Ayush", review: "Nice work"),
                        const SizedBox(width: 10),
                        BuildCard(name: "Priya", review: "Super!"),
                        const SizedBox(width: 10),
                        BuildCard(name: "Debabrata", review: "Fantastic work"),
                        const SizedBox(width: 10),
                        BuildCard(name: "Nilay", review: "Always prefer him!"),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: black,
                        ),
                        label: const Text("Schedule call"),
                      ),
                    ],
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

Widget BuildCard({name, review}) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 100,
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextWidget(
            name,
            16.0,
            FontWeight.w900,
            black,
          ),
          customTextWidget(
            review,
            14.0,
            FontWeight.w500,
            Colors.grey.shade800,
          ),
        ],
      ));
}
