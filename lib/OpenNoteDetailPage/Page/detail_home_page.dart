import 'package:flutter/material.dart';
import 'package:noteit/constant.dart';

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
      body: Column(
        children: [
          Text(
            getdataList[geciciIndex]["NoteTitle"],
            style: TextStyle(fontSize: 55),
          )
        ],
      ),
    );
  }
}
