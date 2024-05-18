import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  bool isDark = false;
  int page = 0;
  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  setPage(int page) {
    this.page = page;
    notifyListeners();
  }
}
