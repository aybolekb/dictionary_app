import 'package:dictionary_app/config/theme/theme.dart';
import 'package:dictionary_app/core/constants/constants.dart';
import 'package:dictionary_app/models/words.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWords extends StatelessWidget {
  const CardWords({
    super.key,
    required this.word,
    required this.onTap,
    required this.isSaved,
  });
  final Words word;
  final Function() onTap;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appColor.secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: onTap,
                    icon: isSaved
                        ? Icon(
                            Icons.bookmark,
                            size: 26,
                            color: appColor.primaryColor,
                          )
                        : const Icon(
                            Icons.bookmark_border_outlined,
                            size: 26,
                          )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Text(word.turkmen,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          )),
                    )
                  ],
                ),
                const Gap(16),
                Row(
                  children: [
                    Image.asset(
                      enFlag,
                      height: 16,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        word.english,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                const Gap(16),
                Row(
                  children: [
                    Image.asset(
                      ruFlag,
                      height: 16,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        word.russion,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
