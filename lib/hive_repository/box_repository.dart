import 'package:hive_flutter/hive_flutter.dart';

import '../model/note_model.dart';

class BoxRepository {
  static const String boxName = "Note";
  static openBox() async {
    return await Hive.openBox<NoteModel>(boxName);
  }

  static Box getBox() {
    return Hive.box<NoteModel>(boxName);
  }

  static closeBox() async {
    return await Hive.box<NoteModel>(boxName).close();
  }
}
