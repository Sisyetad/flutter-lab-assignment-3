import 'package:flutter_albums/features/albums/data/repositories/album_repository.dart';
import 'package:flutter_albums/features/albums/domain/entities/photo_entity.dart';

class FetchPhotos {
  final AlbumRepository repository;

  FetchPhotos(this.repository);

  Future<List<PhotoEntity>> fetchPhotos() async {
  return await repository.fetchPhotos();
}
}
