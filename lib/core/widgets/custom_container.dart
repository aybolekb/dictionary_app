import 'package:dictionary_app/config/theme/theme.dart';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();

    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: appColor.backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: child),
    );
  }
}
