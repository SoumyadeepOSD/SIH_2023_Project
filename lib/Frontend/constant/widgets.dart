import 'package:flutter/material.dart';

Widget customTextWidget(string, size, weight, color) => Text(
      string,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
