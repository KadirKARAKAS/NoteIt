import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteit/HomePageNotes/Page/home_page.dart';
import 'package:noteit/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // listenerFunction();
  runApp(const MaterialApp(
    home: HomePage(),
  ));
  Future.delayed(const Duration(milliseconds: 2000), () async {
    await handleAppStart();
  });
}

Future<void> handleAppStart() async {
  // FirebaseAuth instance oluşturulur
  FirebaseAuth auth = FirebaseAuth.instance;

  // Eğer kullanıcı oturum açmamışsa
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

    runApp(const MaterialApp(
      home: HomePage(),
    ));
  } else {
    // Kullanıcı oturum açmışsa
    // Kullanıcının bitkilerinin saklandığı koleksiyona referans oluşturulur
    // Koleksiyondaki tüm belgeleri almak için sorgu yapılır ve sonuçlar querySnapshot içine kaydedilir

    // Kullanıcının verileri çağırılır
  }
}
