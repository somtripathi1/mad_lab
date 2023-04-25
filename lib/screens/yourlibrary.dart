import 'dart:io';

import 'package:audio_music_player/models/music.dart';
import 'package:audio_music_player/services/music_operations.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class yourlibrary extends StatefulWidget {
  const yourlibrary({Key? key}) : super(key: key);

  @override
  State<yourlibrary> createState() => _yourlibraryState();
}

class _yourlibraryState extends State<yourlibrary> {
  late AudioCache audioCache;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.teal.shade800, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.3])),
          child: Column(
            children: [
              Appbarlibrary(), list()
              //  showfile(),
            ],
          ),
        ),
      ),
    );
  }

  list() {
    List musicList = MusicOperations.getMusic();
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          //padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return createMusic(musicList[index]);
          },
          itemCount: musicList.length,
        ),
      ),
    );
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(music.desc + " - " + music.name,
                  style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          ),
        ],
      ),
    );
  }

  Appbarlibrary() {
    return Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Your Library songs ',
            style: TextStyle(color: Colors.orange, fontSize: 25),
          ),
        ));
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  buttonforfile() {
    return ElevatedButton(
        child: Text("pick a file "),
        onPressed: () async {
          /*final result = await FilePicker.platform.pickFiles(
              allowMultiple: true,
              type: FileType.custom,
              allowedExtensions: ['mp3']);
          if (result == null) {
            return;
          }
*/
/*
          final fileplay = File(result.files.single.path!);
          audioPlayer.setUrl(fileplay.path, isLocal: true);

          //open single file
          final file = result.files.first;

          //openFiles(result.files);
          print('name  ${file.name}');
          print('Bytes  ${file.bytes}');
          print('size  ${file.size}');
          print('Extension  ${file.extension}');
          print('path  ${file.path}');
          final newFile = await saveFilePermanently(file);
          // button(file);
          print('from path  ${file.path}');
          print('To path  ${newFile.path}');
*/
          //audioPlayer.play('${newFile.path}');
        });
  }
}
