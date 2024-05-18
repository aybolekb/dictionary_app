import 'package:dictionary_app/core/widgets/app_bar_custom.dart';
import 'package:dictionary_app/core/widgets/search_bar.dart';
import 'package:dictionary_app/data/all_words.dart';
import 'package:dictionary_app/main.dart';
import 'package:dictionary_app/models/words.dart';
import 'package:dictionary_app/pages/home/widgets/card_words.dart';
import 'package:dictionary_app/pages/home/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Words> allWordsList = [];
  @override
  void initState() {
    for (var word in allWords) {
      allWordsList.add(Words.fromJson(word));
    }
    super.initState();
  }

  String query = '';
  void _onSearch(String quers) {
    setState(() {
      query = quers.toLowerCase();
    });
  }

  List<Words> get _filteredItems => allWordsList
      .where((item) =>
          item.turkmen.toLowerCase().contains(query) ||
          item.english.toLowerCase().contains(query) ||
          item.russion.toLowerCase().contains(query))
      .toList();

  @override
  Widget build(BuildContext context) {
    print({_filteredItems.length, query});
    return SafeArea(
      child: Column(
        children: [
          const AppBarCustom(),
          CustomContainer(
            child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, value, child) {
                  return Column(
                    children: [
                      const Gap(20),
                      SearchBarCustom(
                        onSearch: _onSearch,
                      ),
                      const Gap(20),
                      _filteredItems.isEmpty && query.isNotEmpty
                          ? const Text('Tapylmady...')
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: _filteredItems.isEmpty
                                      ? allWordsList.length
                                      : _filteredItems.length,
                                  itemBuilder: (context, index) {
                                    final item = _filteredItems.isEmpty
                                        ? allWordsList[index]
                                        : _filteredItems[index];
                                    final key = item.id;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: CardWords(
                                          word: item,
                                          onTap: () {
                                            box.containsKey(key)
                                                ? box.delete(key)
                                                : box.put(key, item);
                                          },
                                          isSaved: box.containsKey(key)),
                                    );
                                  }),
                              // child: SizedBox(
                              //   height: double.infinity,
                              //   child: SingleChildScrollView(
                              //     child: Column(
                              //       children: [
                              //         ...List.generate(
                              //             allWordsList.length,
                              //             (index) => Padding(
                              //                   padding:
                              //                       const EdgeInsets.symmetric(vertical: 8),
                              //                   child: CardWords(
                              //                     onTap: ,
                              //                     word: allWordsList[index],
                              //                   ),
                              //                 ))
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
