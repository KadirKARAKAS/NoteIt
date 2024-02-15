import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notes",
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Icon(
            Icons.contact_page_outlined,
            size: 35,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
