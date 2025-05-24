import 'package:dio/dio.dart';
import 'package:flutter_albums/features/albums/data/models/album_model.dart';
import 'package:flutter_albums/features/albums/data/models/photo_model.dart';
import 'package:flutter_albums/features/albums/domain/entities/album_entity.dart';
import 'package:flutter_albums/features/albums/domain/entities/photo_entity.dart';

class AlbumDataSrc {
  final Dio dio;
  AlbumDataSrc({required this.dio});

  Future<List<AlbumEntity>> getAllAlbums() async {
    try {
      final response = await dio.get('/albums');
      return (response.data as List)
          .map((json) => AlbumModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch albums: $e');
    }
  }

  Future<List<PhotoEntity>> getAllPhotos() async {
    try {
      final res = await dio.get('/photos');
      return (res.data as List)
          .map((json) => PhotoModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch photos: $e');
    }
  }
}
