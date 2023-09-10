import 'package:flutter/material.dart';

import 'colors.dart';

Widget customTextWidget(string, size, weight, color) => Text(
      string,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );

Widget customTextField({controllerName, hint, icon}) => TextField(
      controller: controllerName,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: purple,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: blue,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        suffixIcon: Icon(
          icon,
          color: customgrey,
        ),
        hintStyle: TextStyle(color: customgrey),
      ),
    );
