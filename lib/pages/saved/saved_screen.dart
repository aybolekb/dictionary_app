import 'package:dictionary_app/config/theme/theme.dart';
import 'package:dictionary_app/core/widgets/app_bar_custom.dart';
import 'package:dictionary_app/main.dart';
import 'package:dictionary_app/core/widgets/card_words.dart';
import 'package:dictionary_app/core/widgets/custom_container.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    return SafeArea(
      child: Column(
        children: [
          const AppBarCustom(),
          ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return CustomContainer(
                  child: value.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.bookmark,
                                color: appColor.primaryColor,
                                size: 40,
                              ),
                              const Gap(20),
                              Text(
                                'Häzirlikçe bellik boş',
                                style: theme.textTheme.titleSmall,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            const Gap(20),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: value.length,
                                  itemBuilder: (context, index) {
                                    final item = value.getAt(index);
                                    final key = item.id;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: CardWords(
                                          word: item,
                                          onTap: () {
                                            box.delete(key);
                                          },
                                          isSaved: true),
                                    );
                                  }),
                            )
                          ],
                        ),
                );
              }),
        ],
      ),
    );
  }
}
