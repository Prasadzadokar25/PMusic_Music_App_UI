import 'package:flutter/material.dart';
import 'package:pmusic/model/playlist_list.dart';
import 'package:pmusic/model/playlist_model.dart';

import '../model/item_lists.dart';
import 'player_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> {
  final TextEditingController _newPlayListController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    PlayLists.playlistList[1].songList = SongsList.allSongs.where(
      (element) {
        return element.isFavorite == true;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.045),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${PlayLists.playlistList.length} playlists",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        _newPlayListController.clear();
                        showMyBottomSheet(todoEdit: false);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Column(
                  children:
                      List.generate(PlayLists.playlistList.length, (index) {
                    return buildPlaylistCard(
                        PlayLists.playlistList[index], index, false);
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPlaylistCard(
      PlayListModel playlist, int index, bool inBottomSheet) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return MusicPlayerPage(
        //         playlist: SongsList.favarateSongs,
        //         currentSongIndex: index,
        //       );
        //     },
        //   ),
        // );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 8.5, bottom: 8.5, left: 2, right: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: (index < 4)
                    ? const Color.fromARGB(155, 114, 54, 50)
                    : const Color.fromARGB(187, 108, 108, 108),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              height: screenHeight * 0.068,
              width: screenWidth * 0.14,
              child: (playlist.coverUrl != null)
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        playlist.coverUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      (playlist.name == "My favorite")
                          ? Icons.favorite
                          : (playlist.name == "Last added")
                              ? Icons.add
                              : (playlist.name == "Recently played")
                                  ? Icons.watch_later_rounded
                                  : (playlist.name == "Most played")
                                      ? Icons.stairs
                                      : Icons.music_note,
                      color: (index < 4)
                          ? const Color.fromARGB(255, 255, 17, 0)
                          : const Color.fromARGB(255, 220, 217, 217),
                    ),
            ),
            const SizedBox(width: 14),
            SizedBox(
              height: screenHeight * 0.063,
              // color: Color.fromRGBO(19, 19, 19, 1),
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
                      playlist.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color.fromRGBO(224, 224, 224, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          "${playlist.songList.length} songs",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color.fromRGBO(154, 151, 151, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (!inBottomSheet)
              Container(
                height: screenHeight * 0.06,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    showOptionsBottomSheet(playlist, index);
                  },
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

  void showMyBottomSheet({required bool todoEdit, Map? task}) {
    // if (todoEdit == true) {
    //   titleController.text = task!["title"];
    //   descriptionController.text = task["description"];
    //   dateController.text = task['date'];
    // } else {
    //   titleController.clear();
    //   descriptionController.clear();
    //   dateController.clear();
    // }
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text((!todoEdit) ? "New playlist" : "Rename playlist",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Please enter a name";
                          }
                          if (PlayLists.playlistList
                              .any((playlist) => playlist.name == value)) {
                            return "playlist already exit";
                          }
                          return null; // Return null if the input is valid
                        },
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                          setState(() {});
                        },
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                        ),
                        controller: _newPlayListController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 45, 45, 45),
                          hintText: "Enter playlist name",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 147, 147, 147)),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getTopButton(
                      name: "CANCEL",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      isPlayButton: false,
                    ),
                    getTopButton(
                      name: "CREATE",
                      onPressed:
                          onCreateButtonPressed, // Call onCreateButtonPressed here
                      isPlayButton: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getTopButton({
    required String name,
    required Function() onPressed,
    required bool isPlayButton,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: const BorderSide(
          color: Color.fromRGBO(255, 61, 0, 1),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        backgroundColor: (isPlayButton)
            ? const Color.fromRGBO(244, 81, 32, 1)
            : const Color.fromARGB(0, 255, 193, 7),
        fixedSize: Size(
          screenWidth * 0.4326,
          screenHeight * 0.055,
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: (isPlayButton)
              ? const Color.fromRGBO(247, 247, 247, 1)
              : const Color.fromRGBO(255, 61, 0, 1),
        ),
      ),
    );
  }

  void onCreateButtonPressed() {
    if (_formKey.currentState!.validate()) {
      String playlistName = _newPlayListController.text;
      PlayLists.playlistList
          .add(PlayListModel(name: playlistName, songList: []));
      Navigator.of(context).pop();
      setState(() {}); // Close the bottom sheet after successful validation
    }
  }

  void showOptionsBottomSheet(playlist, index) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 13, bottom: 5, left: 15, right: 15),
                  child: buildPlaylistCard(playlist, index, true),
                ),
                const Divider(color: Color.fromARGB(255, 82, 82, 82)),
                ListTile(
                    leading: const Icon(Icons.play_arrow, color: Colors.white),
                    title: const Text('Play',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                    onTap: () {
                      Navigator.pop(context);
                      // Handle play action
                      if (playlist.songList.isNotEmpty) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MusicPlayerPage(
                            songsList: playlist.songList,
                            currentSongIndex: 0,
                          );
                        }));
                      }
                    }),
                ListTile(
                  leading: const Icon(Icons.playlist_add, color: Colors.white),
                  title: const Text('Add to playlist',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle add to playlist action
                  },
                ),
                if (index > 3)
                  Column(
                    children: [
                      const Divider(color: Color.fromARGB(255, 82, 82, 82)),
                      ListTile(
                        leading: const Icon(Icons.edit, color: Colors.white),
                        title: const Text('Rename',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.pop(context);
                          // Handle rename action
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.image, color: Colors.white),
                        title: const Text('Change cover',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.pop(context);
                          // Handle change cover action
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete, color: Colors.white),
                        title: const Text('Delete playlist',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.pop(context);
                          // Handle delete action
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
