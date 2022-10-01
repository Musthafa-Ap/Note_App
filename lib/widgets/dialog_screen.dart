import 'package:note_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/my_home_page.dart';
import '../model/note_model.dart';

Future<dynamic> DiologScreen({int? index, NoteModel? note}) {
  if (index == null) {
    titleController.clear();
    contentController.clear();
  } else {
    titleController.text = note!.title;
    contentController.text = note.content;
  }

  return Get.defaultDialog(
    title: "Note",
    content: Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
              hintText: "Title", border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: contentController,
          decoration: const InputDecoration(
              hintText: "Content", border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
    actions: [
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel")),
      ElevatedButton(
          onPressed: () {
            final _title = titleController.text;
            final _content = contentController.text;
            if (_title.isEmpty || _content.isEmpty) {
              return;
            } else {
              final data = NoteModel(title: _title, content: _content);
              index == null
                  ? Get.find<NoteController>().addNote(data)
                  : Get.find<NoteController>()
                      .editNote(index: index, note: data);
              Get.back();
            }
          },
          child: Text(note != null ? "Update" : "Submit"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)))
    ],
  );
}
