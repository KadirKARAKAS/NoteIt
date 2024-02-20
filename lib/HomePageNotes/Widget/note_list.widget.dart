import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noteit/constant.dart';

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 0),
      shrinkWrap: true,
      itemCount: getdataList.length,
      itemBuilder: (context, index) {
        return noteContainer(size);
      },
    );
  }

  Padding noteContainer(Size size) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: size.width,
        height: 155,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
