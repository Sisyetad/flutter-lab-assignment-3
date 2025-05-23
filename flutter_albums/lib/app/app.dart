// Main App Widget
import 'package:flutter/material.dart';
import 'package:flutter_albums/app/router.dart';
import 'package:flutter_albums/features/albums/domain/usecase/fetch_albums.dart';
import 'package:flutter_albums/features/albums/domain/usecase/fetch_photos.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_bloc.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final AlbumUsecase albumUsecase;
  final FetchPhotos fetchPhotos;

  const App({
    Key? key,
    required this.albumUsecase,
    required this.fetchPhotos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AlbumBloc(
            albumUsecase: albumUsecase,
            fetchPhotosUsecase: fetchPhotos,
          )..add(LoadAlbumsEvent()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Albums App',
      ),
    );
  }
}
