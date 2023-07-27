import 'package:hive/hive.dart';

class HiveMethods {
  String hiveBox = 'hiveBox';

  //Adding to hive db
  void put(String key, dynamic value) {
    var box = Hive.box(hiveBox);
    box.put(key, value);
  }

  //Reading hive db
  dynamic get(String key) {
    var box = Hive.box(hiveBox);
    var value = box.get(key);
    return value;
  }

  //Deleting one data from hive DB
  void delete(String key) {
    var box = Hive.box(hiveBox);
    box.delete(key);
  }

  //Deleting whole data from Hive
  void deleteAll() {
    var box = Hive.box(hiveBox);
    box.clear();
  }
}
