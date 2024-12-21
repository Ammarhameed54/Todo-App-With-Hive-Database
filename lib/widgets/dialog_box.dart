import 'package:flutter/material.dart';
import 'package:todo/widgets/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.blueAccent,
      // ignore: sized_box_for_whitespace
      content: Container(
        height: height * 0.15,
        width: width * 0.7,
        child: Column(
          children: [
            // Textfield for User Input
            Padding(
              padding: EdgeInsets.only(top: height * 0.002),
              child: Container(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Enter Todo Task",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(width * 0.04) ,
                        ),
                  ),
                ),
              ),
            ),

            // Add Note Button
            // Cancel Button

            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    label: "Cancel",
                    onPressed: onCancel,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  MyButton(label: "Add", onPressed: onSave)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
