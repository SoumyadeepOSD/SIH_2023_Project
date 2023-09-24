import 'package:flutter/material.dart';

class UserStateProvider extends ChangeNotifier {
  String? userinfo;

  void setUserInfo(String? value) {
    userinfo = value;
    notifyListeners();
  }
}
