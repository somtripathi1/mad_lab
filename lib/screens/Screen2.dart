import 'package:audio_music_player/models/category.dart';
import 'package:audio_music_player/services/category-operations.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  Screen2({Key? key, required String name}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  Category? category;
  bool viewVisible = true;
//  List music1 = GridElementOneOperations.getGridOne();
  List musicList = CategoryOperations.getCategories();
  bool isPlaying = false;
  AudioPlayer _audioPlayer = new AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: createAppBar("List"),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.teal.shade800, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.1, 0.3])),
            child: miniplayer_grid(category),
            /*     Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                //padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  print('clicked now on list- $index');

                  // if(category.name)
                  // if (index == 4) {
                  return createMusicOne(music1[index], musicList[index]);
                  //} else
                  // return null;
                },
                itemCount: music1.length,
              ),
              */ /*Column(
                children: [

                  Text(
                    "hi",
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                  Text("welcome to the jungle"),
                  */ /* */ /*          createAppBar('Music Player'),
                  const SizedBox(
                    height: 5,
                  ),
                  createGrid(context),
                  createMusicList('Made for you'),
                  createMusicList('Popular PlayList')
          */ /* */ /*
                ],
              ),*/ /*
            ),
       */ //child: Text('Hello Flutter'),
            //color: Colors.orange,
          ),
        ),
      ),
    );
  }

  createAppBar(String msg) {
    return AppBar(
      backgroundColor: Colors.teal,
      elevation: 5,
      titleSpacing: 0,
      title: Text(
        msg,
        style: TextStyle(fontSize: 22),
      ),
      /* actions: [
        Padding(
            padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings))
      ],*/
    );
  }

  /* Widget createMusicOne(GridElementOne g1, Category category,
      {bool stop = false}) {
    if (g1 == null) {
      return SizedBox();
    }

    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    if (category.name == "Adnan\nSami" && g1.name == "Adnan\nSami") {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListTile(
            leading: Image.network(g1.imageURL),
            title: Text(
              g1.songnumber,
              style: TextStyle(color: Colors.orangeAccent, fontSize: 22),
            ),
            trailing: IconButton(
                onPressed: () async {
                  isPlaying = !isPlaying;
                  if (isPlaying) {
                    await _audioPlayer.play(g1.audioURL);
                  } else {
                    await _audioPlayer.pause();
                  }
                  setState(() {});
                },
                icon: isPlaying
                    ? Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 30,
                      )
                    : Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ))),
      );
    } else
      return Text("hello");
  }
*/
  Widget createMusic(Category category) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: InkWell(
              onTap: () {
                //  _miniPlayer_grid(category, stop: true);
              },
              child: Image.network(
                category.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            category.name,
            style: TextStyle(color: Colors.greenAccent, fontSize: 22),
          ),
        ],
      ),
    );
  }

  Widget miniplayer_grid(Category? category, {bool stop = false}) {
    this.category = category;
    if (category == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {
      hideWidget();
    });

    Size deviceSize = MediaQuery.of(context).size;
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: viewVisible,
      child: Container(
        //width: double.infinity,
        //set 100% width of container according to parent widget
        height: deviceSize.height,
        width: deviceSize.width,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(30),
        //  color: Colors.black.withOpacity(0.7),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black26.withOpacity(0.7),
              blurRadius: 7.0,
              offset: new Offset(1.0, 1.0),
            ),
          ],
        ),

        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: Colors.blue,
              width: deviceSize.width / 1.3,
              height: deviceSize.height / 1.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      hideWidget();
                    },
                    icon: Icon(Icons.close),
                  ),
                  Image.network(category.imageURL, fit: BoxFit.scaleDown),
                  Text(
                    category.name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () async {
                        isPlaying = !isPlaying;
                        if (isPlaying) {
                          await _audioPlayer.play(category.audioURL);
                        } else {
                          await _audioPlayer.pause();
                        }
                        setState(() {});
                      },
                      icon: isPlaying
                          ? Icon(Icons.pause, color: Colors.white)
                          : Icon(Icons.play_arrow, color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ),
    );
    /* AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blue,
      width: deviceSize.width / 1.3,
      height: 50,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(category.imageURL, fit: BoxFit.scaleDown),
            Text(
              category.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
                onPressed: () async {
                  isPlaying = !isPlaying;
                  if (isPlaying) {
                    await _audioPlayer.play(category.audioURL);
                  } else {
                    await _audioPlayer.pause();
                  }
                  setState(() {});
                },
                icon: isPlaying
                    ? Icon(Icons.pause, color: Colors.white)
                    : Icon(Icons.play_arrow, color: Colors.white))
          ],
        ),
      ),
    );*/
  }

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }
}
