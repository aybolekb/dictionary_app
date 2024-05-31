import 'package:dictionary_app/config/theme/theme.dart';
import 'package:dictionary_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    return ColoredBox(
      color: appColor.backgroundColor,
      child: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          Image.asset(
            oguzhanLogo,
            height: 150,
          ),
          Text(
            aboutApp,
            style: theme.textTheme.bodyMedium,
          )
        ],
      )),
    );
  }
}
