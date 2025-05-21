// Photo model
class PhotoModel {
  final int id;
  final int albumId;
  final String title;
  final String thumbnailUrl;
  final String url;

  PhotoModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.thumbnailUrl,
    required this.url,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      url: json['url'],
    );
  }
}
