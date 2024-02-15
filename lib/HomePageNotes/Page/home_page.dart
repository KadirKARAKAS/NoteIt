import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteit/HomePageNotes/Widget/search_note_widget.dart';
import 'package:noteit/HomePageNotes/Widget/topbar_widget.dart';
import 'package:noteit/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 100),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TopBarWidget(),
            SizedBox(height: 20),
            SearchNoteWidget(),
          ],
        ),
      ),
    );
  }
}
