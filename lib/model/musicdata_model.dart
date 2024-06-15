class MusicModel {
  final String imageUrl;
  final String songUrl;
  final String name;
  final String year;
  final String description;

  const MusicModel({
    required this.name,
    required this.songUrl,
    required this.year,
    required this.imageUrl,
    required this.description,
  });
}
