import 'package:dictionary_app/pages/home/home_screen.dart';
import 'package:dictionary_app/pages/info/info_screen.dart';
import 'package:dictionary_app/pages/saved/saved_screen.dart';
import 'package:dictionary_app/pages/search/search_screen.dart';
import 'package:dictionary_app/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);
    final List<Widget> screens = [
      const HomeScreen(),
      const SavedScreen(),
      const InfoScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: settingProvider.page,
          onTap: (value) {
            settingProvider.setPage(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                ),
                label: 'Sözlik'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_outlined,
                ),
                label: 'Bellikler'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.info,
                ),
                label: 'Biz barada'),
          ]),
      body: screens[settingProvider.page],
    );
  }
}
