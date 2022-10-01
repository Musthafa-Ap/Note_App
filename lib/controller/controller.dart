import 'package:email_validation/hive_repository/box_repository.dart';
import 'package:email_validation/model/note_model.dart';
import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteController extends GetxController {
  final observableBox = BoxRepository.getBox();
  int get boxLength => observableBox.length;
  Future<void> addNote(NoteModel note) async {
    observableBox.add(note);
    update();
  }

  Future<void> deleteNote({required int index}) async {
    observableBox.deleteAt(index);
    update();
  }

  Future<void> editNote({required int index, required NoteModel note}) async {
    observableBox.putAt(index, note);
    update();
  }
}
