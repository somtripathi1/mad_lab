/*
import 'package:audio_music_player/models/category.dart';
import 'package:audio_music_player/screens/Screen2.dart';
import 'package:audio_music_player/services/category-operations.dart';
import 'package:flutter/material.dart';

class home_new extends StatefulWidget {
  const home_new({Key? key}) : super(key: key);

  @override
  State<home_new> createState() => _home_newState();
}

class _home_newState extends State<home_new> {
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
                stops: const [0.1, 0.3])),
        child: Column(
          children: [
            createAppBar("Music Player"),
            const SizedBox(
              height: 5,
            ),
            createGrid(),
          ],
        ),
      )),
    );
  }

  createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 1,
      title: Text(message),
      actions: [
        Padding(padding: EdgeInsets.only(right: 10)),
      ],
    );
  }

  createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 280,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(),
        //calling network fetched values
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

  Widget createCategory(Category category) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => Screen2()));
      },
      child: Container(
          color: Colors.grey.shade700,
          child: Row(
            children: [
              Image.network(category.imageURL, fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  category.name,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )
            ],
          )),
    );
  }
}
*/
