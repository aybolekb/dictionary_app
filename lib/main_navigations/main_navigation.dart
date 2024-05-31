import 'package:dictionary_app/pages/home/home_screen.dart';
import 'package:dictionary_app/pages/info/info_screen.dart';
import 'package:dictionary_app/pages/saved/saved_screen.dart';
import 'package:dictionary_app/pages/termins/termins_screen.dart';

import 'package:dictionary_app/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);
    const List<Widget> screens = [
      HomeScreen(),
      DefinitionsScreen(),
      SavedScreen(),
      InfoScreen(),
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
              label: 'Sözlük'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_rounded,
              ),
              label: 'Kesgitlemeler'),
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
        ],
      ),
      body: IndexedStack(
        index: settingProvider.page,
        children: screens,
      ),
    );
  }
}
