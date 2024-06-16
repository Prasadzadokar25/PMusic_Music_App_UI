import 'package:pmusic/model/item_lists.dart';
import 'package:pmusic/model/playlist_model.dart';

class PlayLists {
  static List playlistList = [
    PlayListModel(name: "My favorite", songList: []),
    PlayListModel(name: "Last added", songList: []),
    PlayListModel(name: "Recently played", songList: []),
    PlayListModel(name: "Most played", songList: []),
    PlayListModel(name: "prasad", songList: SongsList.discographyItem),
  ];
}
