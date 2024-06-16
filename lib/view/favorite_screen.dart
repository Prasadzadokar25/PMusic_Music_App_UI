import 'package:flutter/material.dart';
import 'package:pmusic/model/item_lists.dart';
import 'package:pmusic/view/player_screen.dart';

import '../model/musicdata_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List favarateSongs = [];
  @override
  void initState() {
    super.initState();
    favarateSongs = SongsList.allSongs.where(
      (element) {
        return element.isFavorite == true;
      },
    ).toList();
  }

  void playFavoriteSongsList() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MusicPlayerPage(songsList: favarateSongs, currentSongIndex: 0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //  double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Favorite",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Text(
                      "${favarateSongs.length} songs",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 254, 254, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getTopButton(
                      name: "Shuffle",
                      icon: Icons.shuffle,
                      onPressed: () {},
                    ),
                    getTopButton(
                      name: "Play",
                      icon: Icons.play_arrow,
                      onPressed: playFavoriteSongsList,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                    favarateSongs.length,
                    (index) {
                      return buildfavoriteSongItemcard(
                          favarateSongs[index], index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTopButton({
    required String name,
    required IconData icon,
    required Function() onPressed,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: const BorderSide(
          color: Color.fromARGB(255, 95, 94, 94),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        backgroundColor: const Color.fromARGB(0, 255, 193, 7),
        fixedSize: Size(
          screenWidth * 0.4326,
          screenHeight * 0.052,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color.fromRGBO(255, 61, 0, 1),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color.fromRGBO(255, 61, 0, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildfavoriteSongItemcard(MusicModel favoriteSongItem, int index) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MusicPlayerPage(
                songsList: favarateSongs,
                currentSongIndex: index,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.083,
              width: screenWidth * 0.1630,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.asset(
                  favoriteSongItem.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Container(
              height: screenHeight * 0.083,
              color: const Color.fromARGB(19, 19, 19, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: Text(
                      favoriteSongItem.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color.fromRGBO(224, 224, 224, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          favoriteSongItem.year,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color.fromRGBO(154, 151, 151, 1),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const CircleAvatar(
                        radius: 2.2,
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        child: Text(
                          favoriteSongItem.description,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color.fromRGBO(132, 125, 125, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: screenHeight * 0.083,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
