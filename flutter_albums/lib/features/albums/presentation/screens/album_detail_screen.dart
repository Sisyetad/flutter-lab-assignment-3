// Album detail screen
import 'package:flutter/material.dart';
import 'package:flutter_albums/core/widgets/error_widget.dart' as core_error;
import 'package:flutter_albums/core/widgets/loading_indicator.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_bloc.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_event.dart';
import 'package:flutter_albums/features/albums/presentation/bloc/album_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumDetailScreen extends StatelessWidget {
  final int albumId;

  const AlbumDetailScreen({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {
    // Trigger album detail loading on screen build
    context.read<AlbumBloc>().add(LoadAlbumDetailsEvent(albumId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 4,
        title: Text(
          "Album $albumId Details",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const LoadingIndicator();
          } else if (state is AlbumDetailsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    state.album.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: state.photos.length,
                    itemBuilder: (context, index) {
                      final photo = state.photos[index];
                      return Image.network(
                        photo.thumbnailUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            color: Color.fromARGB(255, 20, 45, 158),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is AlbumError) {
            return core_error.ErrorMessage(
              message: state.message,
              onRetry:
                  () => context.read<AlbumBloc>().add(
                    LoadAlbumDetailsEvent(albumId),
                  ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
