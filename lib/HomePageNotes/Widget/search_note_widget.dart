import 'package:flutter/material.dart';

class SearchNoteWidget extends StatelessWidget {
  const SearchNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
          color: Color.fromRGBO(113, 113, 113, 100),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
