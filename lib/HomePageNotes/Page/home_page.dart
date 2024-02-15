import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteit/AddNotePage/Page/add_note_page.dart';
import 'package:noteit/HomePageNotes/Widget/search_note_widget.dart';
import 'package:noteit/HomePageNotes/Widget/topbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TopBarWidget(),
                SizedBox(height: 20),
                SearchNoteWidget(),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.red,
                ),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.red,
                ),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: bbuton(),
          ),
        ],
      ),
    );
  }

  GestureDetector bbuton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          CupertinoPageRoute<bool>(
            fullscreenDialog: true,
            builder: (BuildContext context) => AddNotePage(),
          ),
        );
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: const Color.fromRGBO(113, 113, 113, 100),
        ),
      ),
    );
  }
}
