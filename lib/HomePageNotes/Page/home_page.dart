import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteit/AddNotePage/Page/add_note_page.dart';
import 'package:noteit/HomePageNotes/Widget/note_list.widget.dart';
import 'package:noteit/HomePageNotes/Widget/search_note_widget.dart';
import 'package:noteit/HomePageNotes/Widget/topbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print("SAYFA YENNİLENDİ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
          const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TopBarWidget(),
                  //SizedBox(height: 20),
                  // SearchNoteWidget(),
                  SizedBox(height: 20),
                  NoteListWidget(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: Align(alignment: Alignment.bottomRight, child: bbuton()),
          )
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
