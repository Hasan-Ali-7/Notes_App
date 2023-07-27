import 'package:hive/hive.dart';
part 'noteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {

  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int colorIndex;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.colorIndex,
  });
}
