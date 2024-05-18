import 'package:dictionary_app/data/all_words.dart';
import 'package:dictionary_app/models/words.dart';
import 'package:flutter/material.dart';

class RepositoryProvider extends ChangeNotifier {
  List<Words> allWordsList = [];
  List<Words> savedWordsList = [];

  void saveWords(Words word) {
    print({word.id, savedWordsList});
    if (!savedWordsList.contains(word)) {
      savedWordsList.add(word);
    }
    notifyListeners();
  }

  // void removeFromFavorite(Words word) {
  //   savedWords.remove(word);
  //   notifyListeners();
  // }
}
