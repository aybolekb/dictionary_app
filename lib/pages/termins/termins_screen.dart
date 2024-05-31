import 'package:dictionary_app/config/theme/theme.dart';
import 'package:dictionary_app/core/constants/constants.dart';
import 'package:dictionary_app/core/widgets/app_bar_custom.dart';
import 'package:dictionary_app/core/widgets/search_bar.dart';
import 'package:dictionary_app/data/all_words.dart';
import 'package:dictionary_app/main.dart';
import 'package:dictionary_app/core/widgets/custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';

class DefinitionsScreen extends StatefulWidget {
  const DefinitionsScreen({super.key});

  @override
  State<DefinitionsScreen> createState() => _DefinitionsScreenState();
}

class _DefinitionsScreenState extends State<DefinitionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  String query = '';
  void _onSearch(String quers) {
    setState(() {
      query = quers.toLowerCase();
    });
  }

  List<Map<String, dynamic>> get _filteredItems => definitions
      .where((item) =>
          item['def_tk'].toLowerCase().contains(query) ||
          item['def_ru'].toLowerCase().contains(query) ||
          item['def_en_meaning'].toLowerCase().contains(query) ||
          item['def_en'].toLowerCase().contains(query))
      .toList();

  @override
  Widget build(BuildContext context) {
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
                                      ? definitions.length
                                      : _filteredItems.length,
                                  itemBuilder: (context, index) {
                                    final item = _filteredItems.isEmpty
                                        ? definitions[index]
                                        : _filteredItems[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: ListTile(
                                        title: Text(item['def_tk']),
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            enableDrag: true,
                                            showDragHandle: true,
                                            scrollControlDisabledMaxHeightRatio:
                                                0.8,
                                            builder: (context) {
                                              return SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.8,
                                                child: SingleChildScrollView(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 12),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            tmFlag,
                                                            height: 16,
                                                            width: 24,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          const Gap(12),
                                                          Flexible(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  item[
                                                                      'def_tk'],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                                Text(item[
                                                                    'def_en']),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            enFlag,
                                                            height: 16,
                                                            width: 24,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          const Gap(12),
                                                          Flexible(
                                                              child: Text(
                                                            item[
                                                                'def_en_meaning'],
                                                          )),
                                                        ],
                                                      ),
                                                      const Divider(),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ruFlag,
                                                            height: 16,
                                                            width: 24,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          const Gap(12),
                                                          Flexible(
                                                              child: Text(
                                                            item['def_ru'],
                                                          )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        subtitle: Text(
                                          item['def_en'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: const Icon(
                                            Icons.chevron_right_rounded),
                                        leading: Icon(
                                          Icons.menu_book_rounded,
                                          color: AppTheme.primaryColor,
                                        ),
                                      ),
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
