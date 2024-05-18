import 'package:hive/hive.dart';
part 'words.g.dart';

@HiveType(typeId: 0)
class Words {
  @HiveField(0)
  final String turkmen;
  @HiveField(1)
  final String english;
  @HiveField(2)
  final String russion;
  @HiveField(3)
  final int id;

  Words(
      {required this.turkmen,
      required this.english,
      required this.russion,
      required this.id});

  factory Words.fromJson(Map<String, dynamic> json) {
    final turkmen = json['turkmen'] ?? "";
    final english = json['english'] ?? "";
    final russion = json['russian'] ?? "";
    final id = json['id'] is String ? int.tryParse(json['id']) : json['id'];
    return Words(turkmen: turkmen, english: english, russion: russion, id: id);
  }
}
