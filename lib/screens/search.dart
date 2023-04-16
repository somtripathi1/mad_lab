import 'package:audio_music_player/models/music.dart';
import 'package:audio_music_player/services/music_operations.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

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
          // Add padding around the search bar
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [
            createAppbarnew(),
            createSearchbar(),
            //createlistview(),
          ]),
          // Use a Material design search bar
        ),
      ),
    );
  }

  createAppbarnew() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 7),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Search Here',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }

  createSearchbar() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.orange.shade400),
          // Add a clear button to the search bar

          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.orange.shade400,
            ),
            onPressed: () => _searchController.clear(),
          ),
          // Add a search icon or button to the search bar
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.orange.shade400,
            ),
            onPressed: () {
              // Perform the search here
            },
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.teal, width: 2.0),
          ),
          /*OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red, width: 15.0),
          ),*/
        ),
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  createlistview() {
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
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          ),
        ],
      ),
    );
  }
}
