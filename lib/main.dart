import 'package:dictionary_app/config/theme/theme.dart';

import 'package:dictionary_app/models/words.dart';
import 'package:dictionary_app/pages/splash/splash_screen.dart';
import 'package:dictionary_app/provider/repository_provider.dart';
import 'package:dictionary_app/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';

late Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(WordsAdapter());
  box = await Hive.openBox<Words>('saved');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: appColor.primaryColor,
        statusBarIconBrightness: theme.brightness));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SettingProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => RepositoryProvider(),
          ),
        ],
        builder: (context, child) {
          final settingProvider = Provider.of<SettingProvider>(context);

          return MaterialApp(
              title: 'Matematiki sözlük',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode:
                  settingProvider.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const SplachScreen());
        });
  }
}
