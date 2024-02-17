import 'package:flutter/material.dart';
import 'package:noteit/AddNotePage/Widget/add_note_information.dart';
import 'package:noteit/AddNotePage/Widget/back_button_widget.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              children: [
                BackButtonWidget(),
                SizedBox(height: 40),
                AddNoteInformationWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
