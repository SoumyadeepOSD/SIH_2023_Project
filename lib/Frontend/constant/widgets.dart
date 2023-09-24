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

Widget customTextField({controllerName, hint, flag, icon}) => TextFormField(
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
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      if (flag == 0) {
        if (value != null && !value.contains('@')) {
          return 'Enter valid email';
        } else {
          return null;
        }
      } else if (flag == 1) {
        if (value != null && value.length < 6) {
          return 'Enter min 6 characters';
        } else {
          return null;
        }
      }
      return null;
    });

Widget myCustomTextfield({controllerName, hint}) {
  return TextField(
    controller: controllerName,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: customgrey),
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
    ),
  );
}

Widget iconWithText(image, text) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: white),
            child: Image(
              height: 100,
              width: 100,
              image: AssetImage(image),
            ),
          ),
          customTextWidget(text, 12.0, FontWeight.bold, black)
        ],
      ),
    );
