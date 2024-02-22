import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteit/HomePageNotes/Page/home_page.dart';

import 'constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Future.delayed(const Duration(milliseconds: 2000), () async {
    await handleAppStart();
  });
}

Future<void> handleAppStart() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    await FirebaseAuth.instance.signInAnonymously();
    Map<String, dynamic> mapSaveData = {};
    if (Platform.isIOS) {
      mapSaveData = {'Platform': 'iOS'};
    } else {
      mapSaveData = {'Platform': 'Android'};
    }
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(mapSaveData);
    userID = auth.currentUser!.uid;

    runApp(const MaterialApp(
      home: HomePage(),
    ));
  } else {
    userID = auth.currentUser!.uid;
    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Notes");

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) {
      docIDList.add(doc.id);
      getdataList.add(doc.data());
    });

    if (getdataList.isEmpty) {
      print("LİSTE BOŞ");
      runApp(const MaterialApp(
        home: HomePage(),
      ));
    } else {
      print("LİSTE DOLU");

      runApp(const MaterialApp(
        home: HomePage(),
      ));
    }
  }
}
