import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'dialog_screen.dart';
import '../model/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final NoteModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 19),
                width: double.infinity,
                height: MediaQuery.of(context).size.width * .16,
                color: Color.fromARGB(227, 29, 35, 29),
                child: Text(
                  note.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                      onPressed: () {
                        DiologScreen(index: index, note: note);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )))
            ],
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: MediaQuery.of(context).size.width * .3,
                color: Color.fromARGB(255, 43, 43, 41),
                child: Text(
                  note.content,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                      onPressed: () {
                        Get.find<NoteController>().deleteNote(index: index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )))
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
