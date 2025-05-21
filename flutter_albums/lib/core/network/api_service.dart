// Retrofit API service
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/albums/data/models/album_model.dart';
import '../../features/albums/data/models/photo_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/albums")
  Future<List<AlbumModel>> getAlbums();

  @GET("/")
  Future<List<PhotoModel>> getPhotos();
}
