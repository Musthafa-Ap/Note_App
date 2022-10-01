import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import '../widgets/note_card.dart';
import '../model/note_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/floating_button.dart';

TextEditingController titleController = TextEditingController();
TextEditingController contentController = TextEditingController();

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NoteController());
    return GetMaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 6, 5, 5),
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 45, 43, 43),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 25))),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
              child: AppBarWidget(), preferredSize: Size.fromHeight(55)),
          floatingActionButton: FloatingButton(),
          body:
              SafeArea(child: GetBuilder<NoteController>(builder: (controller) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.boxLength,
                itemBuilder: (BuildContext context, int index) {
                  if (controller.boxLength > 0) {
                    NoteModel note = controller.observableBox.getAt(index);
                    return NoteCard(
                      note: note,
                      index: index,
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "Note is empty",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    );
                  }
                });
          })),
        ));
  }
}
