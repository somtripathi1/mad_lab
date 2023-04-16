import 'package:audio_music_player/models/music.dart';
import 'package:audio_music_player/services/music_operations.dart';
import 'package:flutter/material.dart';

class yourlibrary extends StatefulWidget {
  const yourlibrary({Key? key}) : super(key: key);

  @override
  State<yourlibrary> createState() => _yourlibraryState();
}

class _yourlibraryState extends State<yourlibrary> {
  @override
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
            children: [Appbarlibrary(), list()],
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
}
