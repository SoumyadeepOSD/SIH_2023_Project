import 'package:flutter/material.dart';

class GeneralStateProvider extends ChangeNotifier {
  String? location;
  String? userEmail;
  String? userFName;
  String? userLName;
  String? userPhNo;
  int language = -1;
  // Provider side
  bool? ongoing = true;
  bool? upcoming = false;
  bool? history = false;
  //
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

  void setLang(int lang) {
    language = lang;
    notifyListeners();
  }

  void onGoingState() {
    if (ongoing == false) {
      ongoing = true;
      notifyListeners();
    }
    upcoming = false;
    history = false;
    notifyListeners();
  }

  void upComingState() {
    if (upcoming == false) {
      upcoming = true;
      notifyListeners();
    }
    ongoing = false;
    history = false;
    notifyListeners();
  }

  void historyState() {
    if (history == false) {
      history = true;
      notifyListeners();
    }
    ongoing = false;
    upcoming = false;
    notifyListeners();
  }
}
