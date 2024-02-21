import 'package:flutter/material.dart';
import 'package:noteit/constant.dart';

class DetailPageNoteInformation extends StatelessWidget {
  const DetailPageNoteInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getdataList[geciciIndex]["NoteTitle"],
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(146, 146, 146, 100),
          ),
        ),
        SizedBox(height: 20),
        Text(
          getdataList[geciciIndex]["NoteParagraf"],
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(146, 146, 146, 100),
          ),
        )
      ],
    );
  }
}
