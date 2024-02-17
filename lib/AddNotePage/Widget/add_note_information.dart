import 'package:flutter/material.dart';

class AddNoteInformationWidget extends StatefulWidget {
  const AddNoteInformationWidget({Key? key}) : super(key: key);

  @override
  _AddNoteInformationWidgetState createState() =>
      _AddNoteInformationWidgetState();
}

class _AddNoteInformationWidgetState extends State<AddNoteInformationWidget> {
  late TextEditingController _textFieldControllerTitle;
  late TextEditingController _textFieldControllerParagraf;
  int sayi = 0;

  @override
  void initState() {
    super.initState();
    _textFieldControllerTitle = TextEditingController();
    _textFieldControllerParagraf = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldControllerTitle.dispose();
    _textFieldControllerParagraf.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 110),
      child: Column(
        children: [
          TitleTextField(),
          ParagrafTextField(),
          InkWell(
            onTap: () {
              print(_textFieldControllerTitle);
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  TextField ParagrafTextField() {
    return TextField(
      maxLength: 255,
      maxLines: 7,
      style: const TextStyle(
          fontSize: 16, color: Color.fromRGBO(146, 146, 146, 100)),
      controller: _textFieldControllerParagraf,
      decoration: const InputDecoration(
        counterStyle: TextStyle(color: Color.fromRGBO(146, 146, 146, 100)),
        border: InputBorder.none,
        hintText: 'Type something here...',
        hintStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(146, 146, 146, 100)),
      ),
    );
  }

  TextField TitleTextField() {
    return TextField(
      style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(146, 146, 146, 100)),
      controller: _textFieldControllerTitle,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(146, 146, 146, 100))),
    );
  }
}
