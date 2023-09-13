import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';

Widget sliderCard({required String name, required String review}) {
  return Card(
    child: Column(
      children: [
        customTextWidget(
          name,
          14.0,
          FontWeight.w500,
          black,
        ),
        customTextWidget(
          review,
          12,
          FontWeight.w500,
          customgrey,
        )
      ],
    ),
  );
}
