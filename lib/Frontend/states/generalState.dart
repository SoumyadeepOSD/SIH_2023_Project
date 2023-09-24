import 'package:flutter/material.dart';

class GeneralStateProvider extends ChangeNotifier {
  String? location;
  String? userEmail;
  String? userFName;
  String? userLName;
  String? userPhNo;
  void setLocation(String? value) {
    location = value;
    notifyListeners();
  }

  void setUser(String? fname, String? lname, String? email, String? phone) {
    userEmail = email;
    userFName = fname;
    userLName = lname;
    userPhNo = phone;
    notifyListeners();
  }
}
