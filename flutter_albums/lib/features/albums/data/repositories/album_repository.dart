

import 'package:flutter_albums/core/network/api_service.dart';
import 'package:flutter_albums/features/albums/data/models/album_model.dart';
import 'package:flutter_albums/features/albums/data/models/photo_model.dart';

class AlbumRepository {
  final ApiService apiService;

  AlbumRepository({required this.apiService});

  Future<List<AlbumModel>> fetchAlbums() async {
    try {
      return await apiService.getAlbums();
    } catch (e) {
      throw Exception('Failed to fetch albums: $e');
    }
  }

  Future<List<PhotoModel>> fetchPhotos() async {
    try {
      return await apiService.getPhotos();
    } catch (e) {
      throw Exception('Failed to fetch photos: $e');
    }
  }

  /// Fetches photos only for the selected album
  Future<List<PhotoModel>> fetchPhotosForAlbum(int albumId) async {
    final allPhotos = await fetchPhotos();
    return allPhotos.where((photo) => photo.albumId == albumId).toList();
  }
}
