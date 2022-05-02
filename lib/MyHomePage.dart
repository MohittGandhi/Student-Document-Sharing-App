import 'dart:typed_data';

import 'package:file_share/googlefirst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.blueAccent,
                height: 190,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              height: 170,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: data,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Enter Message')
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () async{
                    final weburl = 'https://drive.google.com/drive/folders/1DFzG0RFz4PI0D9aoJ16aLK8D38gxq6zj?usp=sharing';
                    if(data.value.text.isNotEmpty){
                      await Share.share('${data.text} ${weburl}');
                    }
                  },
                      child: const Text('Share Text Message')),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  ElevatedButton(
                    child: const Text('  Document Share '),
                    onPressed: () async {

                      final result = await FilePicker.platform.pickFiles();

                      List<String>? files = result?.files
                          .map((file) => file.path)
                          .cast<String>()
                          .toList();

                      if (files == null) {
                        return;
                      }
                      await Share.shareFiles(files);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
