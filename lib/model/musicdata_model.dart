class MusicModel {
  final String name;
  final String songUrl;
  final String imageUrl;
  final String year;
  String description;
  bool isFavorite;

  MusicModel({
    required this.name,
    required this.songUrl,
    required this.year,
    required this.imageUrl,
    this.description = "default",
    this.isFavorite = false,
  });
}
