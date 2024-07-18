class PlayListModel {
  String name;
  int id;
  List songList;
  String? coverUrl;

  PlayListModel({
    required this.name,
    required this.id,
    required this.songList,
    this.coverUrl,
  });
}
