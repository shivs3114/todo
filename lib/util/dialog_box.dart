import 'package:flutter/material.dart';
import 'package:todo/util/Mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller1;
  VoidCallback onsave;
  VoidCallback oncancel;

  DialogBox(
      {super.key,
      required this.controller1,
      required this.oncancel,
      required this.onsave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[500],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                  hoverColor: Colors.red,
                  border: OutlineInputBorder(),
                  hintText: "Add new Task..."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  name: 'Save',
                  onPressed: onsave,
                  color: Colors.deepOrange,
                ),
                const SizedBox(
                  width: 4,
                ),
                MyButton(
                  name: 'Cancel',
                  onPressed: oncancel,
                  color: Colors.deepOrange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
