import 'package:flutter/material.dart';
import 'package:noteit/HomePageNotes/Widget/topbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TopBarWidget(),
          ],
        ),
      ),
    );
  }
}
