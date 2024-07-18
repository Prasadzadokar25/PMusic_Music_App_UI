import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/playlist_model.dart';

class DisplayPlayList extends StatefulWidget {
  PlayListModel playListModel;
  DisplayPlayList({required this.playListModel, super.key});

  @override
  State<DisplayPlayList> createState() => _DisplayPlayListState();
}

class _DisplayPlayListState extends State<DisplayPlayList> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color.fromARGB(255, 105, 116, 119),
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: (widget.playListModel.id == 1)
                        ? const Icon(
                            Icons.favorite_rounded,
                            size: 60,
                            color: Color.fromARGB(255, 221, 88, 88),
                          )
                        : (widget.playListModel.coverUrl != null)
                            ? Image.network(widget.playListModel.coverUrl!)
                            : Image.asset(
                                "assets/images/playlist_placeholder.png",
                                height: 160,
                              ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 150,
                  width: 200,
                  child: Column(
                    children: [
                      Text(
                        widget.playListModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Playlist ${widget.playListModel.songList.length} songs",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
