import 'package:audio_music_player/models/category.dart';
import 'package:audio_music_player/models/music.dart';
import 'package:audio_music_player/screens/home.dart';
import 'package:audio_music_player/screens/search.dart';
import 'package:audio_music_player/screens/yourlibrary.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  Music? music;
  Category? category;
  bool viewVisible = true;
  AudioPlayer _audioPlayer = new AudioPlayer();

  Widget miniplayer(Music? music, {bool stop = false}) {
    this.music = music;
    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {
      showWidget();
    });
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.teal,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(music.image, fit: BoxFit.cover),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioPlayer.play(music.audioURL);
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
    );
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
      //showWidget();
      //hideWidget();
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
              height: deviceSize.height / 1.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      hideWidget();
                      //     viewVisible = false;
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

  @override
  initState() {
    super.initState();
    Tabs = [home(miniplayer, miniplayer_grid), search(), yourlibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Tabs[currentTabIndex],
            Center(child: miniplayer_grid(category)),
          ],
        ),
        backgroundColor: Colors.black,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            miniplayer(music),
            BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: (currentIndex) {
                print("Current Index is $currentIndex");
                currentTabIndex = currentIndex;
                setState(() {}); // re-render
              },
              backgroundColor: Colors.black38,
              selectedLabelStyle: TextStyle(color: Colors.white),
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.white),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books, color: Colors.white),
                    label: 'Your Library')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
