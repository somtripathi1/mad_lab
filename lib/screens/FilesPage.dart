import 'package:file_picker/src/platform_file.dart';
import 'package:flutter/material.dart';

class FilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FilesPage({
    Key? key,
    required this.files,
    required this.onOpenedFile,
  }) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All files"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: 280,
          child: GridView.count(
            childAspectRatio: 5 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              /*  await file.writeAsBytes((await loadAsset()).buffer.asUint8List());
    final result = await audioPlayer.play(file.path, isLocal: true)], //calling network fetched values
      */
              Text("hi"),
            ],
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
