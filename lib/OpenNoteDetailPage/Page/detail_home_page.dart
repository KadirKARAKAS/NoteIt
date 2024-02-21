import 'package:flutter/material.dart';
import 'package:noteit/OpenNoteDetailPage/Widget/back_button.dart';
import 'package:noteit/OpenNoteDetailPage/Widget/detail_page_note_information.dart';

class DetailHomePage extends StatefulWidget {
  const DetailHomePage({super.key});

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidg(),
            SizedBox(height: 15),
            DetailPageNoteInformation(),
          ],
        ),
      ),
    );
  }
}
