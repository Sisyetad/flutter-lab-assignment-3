// GoRouter Configuration
import 'package:flutter/material.dart';
import 'package:flutter_albums/features/albums/presentation/screens/album_detail_screen.dart';
import 'package:flutter_albums/features/albums/presentation/screens/album_list_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AlbumListScreen()),
    GoRoute(
      path: '/album/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '');
        if (id == null) {
          return const Scaffold(body: Center(child: Text('Invalid album ID')));
        }
        return AlbumDetailScreen(albumId: id);
      },
    ),
  ],
);
