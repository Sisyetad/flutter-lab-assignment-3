import 'package:flutter_albums/features/albums/data/source/album_data_src.dart';
import 'package:flutter_albums/features/albums/domain/entities/album_entity.dart';
import 'package:flutter_albums/features/albums/domain/entities/photo_entity.dart';

class AlbumRepository {
  final AlbumDataSrc albumDataSrc;

  AlbumRepository({required this.albumDataSrc});

  Future<List<AlbumEntity>> fetchAlbums() async {
    return await albumDataSrc.getAllAlbums();
  }

  Future<List<PhotoEntity>> fetchPhotos() async {
    return await albumDataSrc.getAllPhotos();
  }
}
