import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    "hi",
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                  Text("welcome to the jungle"),
                  /*          createAppBar('Music Player'),
                  const SizedBox(
                    height: 5,
                  ),
                  createGrid(context),
                  createMusicList('Made for you'),
                  createMusicList('Popular PlayList')
          */
                ],
              ),
            ),
            //child: Text('Hello Flutter'),
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
}
