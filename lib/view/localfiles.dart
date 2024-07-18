import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class LocalFilesMusic extends StatefulWidget {
  const LocalFilesMusic({super.key});

  @override
  _LocalFilesMusicState createState() => _LocalFilesMusicState();
}

class _LocalFilesMusicState extends State<LocalFilesMusic> {
  List<FileSystemEntity> _mp3Files = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (await Permission.storage.request().isGranted) {
      _listMP3Files();
    }
  }

  Future<void> _listMP3Files() async {
    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      final files = directory.listSync(recursive: true);
      setState(() {
        _mp3Files = files.where((file) => file.path.endsWith('.mp3')).toList();
      });
    }
  }

  void _playMP3(String path) {
    _audioPlayer.play(DeviceFileSource(path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local MP3 Player'),
      ),
      body: _mp3Files.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _mp3Files.length,
              itemBuilder: (context, index) {
                final file = _mp3Files[index];
                return ListTile(
                  title: Text(file.path.split('/').last),
                  onTap: () => _playMP3(file.path),
                );
              },
            ),
    );
  }
}
