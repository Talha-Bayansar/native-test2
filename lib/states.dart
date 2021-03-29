import 'package:flutter/cupertino.dart';
import 'bibliotheek.dart' as lib;

class States extends ChangeNotifier {
  String selectedCategory = "All";
  bool isVideoDone = false;
  List<dynamic> vragen = lib.vragen;

  void setCategory(String category) {
    this.selectedCategory = category;
    setVragenCategory();
    notifyListeners();
  }

  void setVideoDone() {
    isVideoDone = true;
    notifyListeners();
  }

  void setVragenCategory() {
    List<dynamic> list = [];
    if (selectedCategory == "All") {
      list = lib.vragen;
    } else {
      for (int i = 0; i < lib.vragen.length; i++) {
        if (lib.vragen[i]["categorie"].contains(selectedCategory)) {
          list.add(lib.vragen[i]);
        }
      }
    }
    this.vragen = list;
    lib.startOpnieuw.add(true);
    notifyListeners();
  }
}
