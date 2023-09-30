import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Select Type",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
    );
  }
}
