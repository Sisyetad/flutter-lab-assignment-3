// Main App Widget
import 'package:flutter/material.dart';
import 'package:flutter_albums/app/router.dart';
import 'package:flutter_albums/features/albums/data/repositories/album_repository.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_bloc.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final AlbumRepository repository;

  const App({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc(repository: repository)..add(LoadAlbumsEvent()),
      child: MaterialApp.router(
        title: 'Album List',
        theme: ThemeData(primarySwatch: Colors.indigo),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
