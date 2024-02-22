import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteit/HomePageNotes/Page/home_page.dart';
import 'package:noteit/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNoteInformationWidget extends StatefulWidget {
  const AddNoteInformationWidget({Key? key}) : super(key: key);

  @override
  _AddNoteInformationWidgetState createState() =>
      _AddNoteInformationWidgetState();
}

class _AddNoteInformationWidgetState extends State<AddNoteInformationWidget> {
  late TextEditingController _textFieldControllerTitle;
  late TextEditingController _textFieldControllerParagraf;
  int sayi = 0;

  @override
  void initState() {
    super.initState();
    _textFieldControllerTitle = TextEditingController();
    _textFieldControllerParagraf = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldControllerTitle.dispose();
    _textFieldControllerParagraf.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              TitleTextField(),
              ParagrafTextField(),
              SizedBox(height: 20),
              _buildGridView(),
            ],
          ),
          Positioned(bottom: 20, right: 0, child: saveDataButton()),
        ],
      ),
    );
  }

  GestureDetector saveDataButton() {
    return GestureDetector(
      onTap: () async {
        addToDatabase();
        final userRef = FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("Notes");

        final querySnapshot = await userRef.get();
        getdataList.clear();
        querySnapshot.docs.forEach((doc) {
          getdataList.add(doc.data());
        });
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

  final Map<Color, String> colorNames = {
    Colors.red: 'red',
    Colors.blue: 'blue',
    Colors.green: 'green',
    Colors.yellow: 'yellow',
    Colors.orange: 'orange',
    Colors.purple: 'purple',
    Colors.teal: 'teal',
    Colors.pink: 'pink',
  };

  Widget _buildGridView() {
    final List<Color> containerColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
    ];

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 120 / 55,
      ),
      itemCount: 8,
      padding: EdgeInsetsDirectional.all(0),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            final Color color = containerColors[index % containerColors.length];
            containerColorName = colorNames[color] ?? 'unknown';
            print("Container color name: $containerColorName");
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: containerColors[index % containerColors.length],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
    );
  }

  TextField ParagrafTextField() {
    return TextField(
      maxLines: 7,
      style: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(146, 146, 146, 100),
      ),
      controller: _textFieldControllerParagraf,
      decoration: const InputDecoration(
        counterStyle: TextStyle(color: Color.fromRGBO(146, 146, 146, 100)),
        border: InputBorder.none,
        hintText: 'Type something here...',
        hintStyle: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(146, 146, 146, 100),
        ),
      ),
    );
  }

  TextField TitleTextField() {
    return TextField(
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(146, 146, 146, 100),
      ),
      controller: _textFieldControllerTitle,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
        hintStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(146, 146, 146, 100),
        ),
      ),
    );
  }

  Future<void> addToDatabase() async {
    String title = _textFieldControllerTitle.text;
    String paragraf = _textFieldControllerParagraf.text;
    String containerColor = containerColorName;

    final notesInfo = {
      "NoteTitle": title,
      "NoteParagraf": paragraf,
      "NoteContainerColor": containerColor,
    };

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Notes")
        .add(notesInfo);

    _textFieldControllerTitle.clear();
    _textFieldControllerParagraf.clear();

    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Notes");

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) {
      getdataList.add(doc.data());
      docIDList.add(doc.id);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
