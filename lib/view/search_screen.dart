import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmusic/model/item_lists.dart';

import '../model/musicdata_model.dart';
import 'player_screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<SearchPage> {
  List _allSongs = SongsList.allSongs;

  List _filteredSongs = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredSongs = _allSongs;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    setState(() {
      _filteredSongs = _allSongs
          .where((song) => song.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 216, 215, 215),
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    //minHeight: 50,
                    maxHeight: 42,
                    // minWidth: 300,
                    maxWidth: screenWidth * 0.87,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _searchController.clear();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  hintText: 'Search Songs...',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 216, 215, 215), fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(56, 56, 56, 1),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredSongs.length,
                itemBuilder: (context, index) {
                  return buildfavoriteSongItemcard(
                      _filteredSongs[index], index);
                },
              ),
            ),
          ],
        ),
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
                songsList: SongsList.allSongs,
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
              height: screenHeight * 0.080,
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
              height: screenHeight * 0.080,
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
                        fontSize: 12,
                        color: Color.fromRGBO(203, 200, 200, 1),
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
                            color: Color.fromRGBO(132, 125, 125, 1),
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
