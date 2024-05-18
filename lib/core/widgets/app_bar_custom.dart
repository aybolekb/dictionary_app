import 'package:dictionary_app/config/theme/theme.dart';
import 'package:dictionary_app/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    final settingProvider = Provider.of<SettingProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Text(
            'Matematiki termin sözligi',
            style: theme.textTheme.titleLarge
                ?.copyWith(color: DarkColor().textColor),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                settingProvider.changeTheme();
              },
              icon: Icon(
                settingProvider.isDark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: DarkColor().textColor,
                size: 30,
              )),
        ],
      ),
    );
  }
}
