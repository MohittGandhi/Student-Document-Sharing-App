import 'dart:typed_data';

import 'package:file_share/googlefirst.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'File Sharing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: firstpage(),
    );
  }
}


