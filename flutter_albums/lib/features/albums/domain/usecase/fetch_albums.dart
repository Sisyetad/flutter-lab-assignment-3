import 'package:flutter_albums/features/albums/data/repositories/album_repository.dart';
import 'package:flutter_albums/features/albums/domain/entities/album_entity.dart';

class AlbumUsecase {
  final AlbumRepository repository;
  AlbumUsecase(this.repository);

  Future<List<AlbumEntity>> call() => repository.fetchAlbums();
}
