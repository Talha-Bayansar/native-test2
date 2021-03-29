import 'package:flutter/cupertino.dart';

class States extends ChangeNotifier {
  String selectedCategory;
  bool isVideoDone = false;

  void setCategory(String category) {
    this.selectedCategory = category;
    notifyListeners();
  }

  void setVideoDone() {
    isVideoDone = true;
    notifyListeners();
  }
}
