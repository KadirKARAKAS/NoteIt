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
        coloorrrr = getdataList[index]["NoteContainerColor"];
        return noteContainer(
            size,
            coloorrrr,
            index,
            getdataList[index]["NoteTitle"],
            getdataList[index]["NoteParagraf"]);
      },
    );
  }

  Padding noteContainer(
      Size size, String color, int index, String title, String paragraph) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          print(getdataList[index]["NoteTitle"]);
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
                          style: TextStyle(
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
                right: 20,
                bottom: 55,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.white,
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
}
