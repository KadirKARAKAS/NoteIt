import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteit/OpenNoteDetailPage/Page/detail_home_page.dart';
import 'package:noteit/constant.dart';

class NoteListWidget extends StatefulWidget {
  const NoteListWidget({super.key});

  @override
  State<NoteListWidget> createState() => _NoteListWidgetState();
}

class _NoteListWidgetState extends State<NoteListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      shrinkWrap: true,
      itemCount: getdataList.length,
      itemBuilder: (context, index) {
        coloorrrr = getdataList[index]["NoteContainerColor"];
        return noteContainer(
            size,
            coloorrrr,
            index,
            getdataList[index]["NoteTitle"],
            getdataList[index]["NoteParagraf"],
            context,
            docIDList[index]);
      },
    );
  }

  Padding noteContainer(Size size, String color, int index, String title,
      String paragraph, context, String docID) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          geciciIndex = index;
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute<bool>(
              fullscreenDialog: true,
              builder: (BuildContext context) => const DetailHomePage(),
            ),
          );
        },
        child: Container(
          width: size.width,
          height: 155,
          decoration: BoxDecoration(
              color: colorWithString(color),
              borderRadius: BorderRadius.circular(13)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, right: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: title,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                    RichText(
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: paragraph,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 30,
                bottom: 60,
                child: InkWell(
                  onTap: () async {
                    geciciIndex = index;

                    await FirebaseFirestore.instance
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("Notes")
                        .doc(docID)
                        .delete();
                    getdataList.removeAt(index);
                    docIDList.removeAt(index);
                    setState(() {
                      print("setstate");
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Image.asset("assets/trash1.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color colorWithString(String color) {
    switch (color) {
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "green":
        return Colors.green;
      case "yellow":
        return Colors.yellow;
      case "orange":
        return Colors.orange;
      case "purple":
        return Colors.purple;
      case "teal":
        return Colors.teal;
      case "pink":
        return Colors.pink;

      default:
        return Colors.white;
    }
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Will you erase the note?"),
      content: Text("AIf you delete the note, you cannot bring it back!"),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Delete"),
          onPressed: () {},
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
