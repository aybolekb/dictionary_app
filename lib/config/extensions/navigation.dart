import 'package:dictionary_app/pages/info/info_screen.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }

  void pushAndRemoveUntil(Widget screen) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

  openInfoScreen() {
    push(const InfoScreen());
  }
}
