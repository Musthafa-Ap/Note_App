import 'package:flutter/material.dart';

import 'dialog_screen.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          DiologScreen();
        },
        child: const Icon(Icons.add));
  }
}
