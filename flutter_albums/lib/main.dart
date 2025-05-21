import 'package:flutter/material.dart';
import 'package:flutter_albums/app/router.dart';
import 'package:flutter_albums/core/network/api_service.dart';
import 'package:flutter_albums/core/network/dio_client.dart';
import 'package:flutter_albums/features/albums/data/repositories/album_repository.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_bloc.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = DioClient().dio;
    final apiService = ApiService(dio);
    final repository = AlbumRepository(apiService: apiService);
    return BlocProvider(
      create: (_) => AlbumBloc(repository: repository)..add(LoadAlbumsEvent()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        routerConfig: router,
      ),
    );
  }
}
