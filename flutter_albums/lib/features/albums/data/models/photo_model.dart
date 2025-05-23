import 'package:flutter_albums/features/albums/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  PhotoModel({
    required super.id,
    required super.albumId,
    required super.title,
    required super.thumbnailUrl,
    required super.url,
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

  static PhotoModel fromEntity(PhotoEntity entity) {
    return PhotoModel(
      id: entity.id,
      albumId: entity.albumId,
      title: entity.title,
      thumbnailUrl: entity.thumbnailUrl,
      url: entity.url,
    );
  }
}
