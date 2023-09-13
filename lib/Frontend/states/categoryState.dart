import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String category = 'Lawyer';
  void toogleLawyer() {
    category = 'Lawyer';
    notifyListeners();
  }

  void toogleMunsi() {
    category = 'Munsi';
    notifyListeners();
  }

  void toogleWriter() {
    category = 'Writer';
    notifyListeners();
  }

  void toogleDistributor() {
    category = 'Distributor';
    notifyListeners();
  }
}
