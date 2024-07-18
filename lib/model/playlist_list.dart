import 'package:pmusic/model/item_lists.dart';
import 'package:pmusic/model/playlist_model.dart';

class PlayLists {
  static List playlistList = [
    PlayListModel(name: "My favorite", songList: [],id: 1),
    PlayListModel(name: "Last added", songList: [],id: 2),
    PlayListModel(name: "Recently played", songList: [],id: 3),
    PlayListModel(name: "Most played", songList: [],id: 4),
    PlayListModel(name: "prasad", songList: SongsList.discographyItem,id: 5),
  ];
}
