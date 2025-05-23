import 'package:flutter_albums/features/albums/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel({required super.id, required super.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(id: json['id'], title: json['title']);
  }

  static AlbumModel fromEntity(AlbumEntity entity) {
    return AlbumModel(id: entity.id, title: entity.title);
  }
}
