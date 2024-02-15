import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Notes",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 30,
            height: 20,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
