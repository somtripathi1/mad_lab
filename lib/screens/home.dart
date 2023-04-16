import 'package:audio_music_player/models/category.dart';
import 'package:audio_music_player/models/music.dart';
import 'package:audio_music_player/services/category-operations.dart';
import 'package:audio_music_player/services/music_operations.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  Function _miniPlayer;
  home(this._miniPlayer, {super.key}); // Dart Constructor ShortHand

  // const home({Key? key}) : super(key: key);
//For grid layout
  Widget createCategory(Category category) {
    return Container(
        color: Colors.grey.shade700,
        child: Row(
          children: [
            Image.network(category.imageURL, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                category.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )
          ],
        ));
  }

//Appbar layout
  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 1,
      title: Text(message),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings))
      ],
    );
  }

//grid structure
  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 280,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(), //calling network fetched values
        crossAxisCount: 2,
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList =
        CategoryOperations.getCategories(); // Rec Data
    // Convert Data to Widget Using map function
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
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
                _miniPlayer(music, stop: true);
              },
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.greenAccent, fontSize: 22),
          ),
          SizedBox(
            height: 7,
          ),
          Text(music.desc,
              style: TextStyle(color: Colors.orange.shade400, fontSize: 18))
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List musicList = MusicOperations.getMusic();
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              //padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        child: Column(
          children: [
            createAppBar('Music Player'),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            createMusicList('Made for you'),
            createMusicList('Popular PlayList')
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.teal.shade800, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3])),
        //child: Text('Hello Flutter'),
        //color: Colors.orange,
      )),
    );
  }
}
