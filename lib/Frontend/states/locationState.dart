import 'package:flutter/material.dart';

class LocationStateProvider extends ChangeNotifier {
  String? location;

  void setLocation(String? value) {
    location = value;
    notifyListeners();
  }
}
