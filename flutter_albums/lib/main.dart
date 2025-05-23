import 'package:flutter/material.dart';
import 'package:flutter_albums/app/app.dart';
import 'package:flutter_albums/features/albums/domain/usecase/fetch_albums.dart';
import 'package:flutter_albums/features/albums/domain/usecase/fetch_photos.dart';
import 'package:flutter_albums/features/albums/data/source/album_data_src.dart';
import 'package:flutter_albums/features/albums/data/repositories/album_repository.dart';
import 'package:flutter_albums/core/network/dio_client.dart';

void main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = DioClient().dio;
    final dataSrc = AlbumDataSrc(dio: dio);
    final repository = AlbumRepository(albumDataSrc: dataSrc);
    final albumUsecase = AlbumUsecase(repository);
    final fetchPhotos = FetchPhotos(repository);

    return App(
      albumUsecase: albumUsecase,
      fetchPhotos: fetchPhotos,
    );
  }
}

