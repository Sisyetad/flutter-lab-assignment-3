class PhotoEntity {
  final int id;
  final int albumId;
  final String title;
  final String thumbnailUrl;
  final String url;
  PhotoEntity({required this.albumId, required this.id, required this.thumbnailUrl, required this.title, required this.url});
}
