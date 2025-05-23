import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/album_bloc.dart';
import '../bloc/album_event.dart';
import '../bloc/album_state.dart';
import '../widgets/album_tile.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/error_widget.dart' as core_error;
import 'package:go_router/go_router.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({super.key});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // This gets called when coming back from AlbumDetailScreen
    final route = ModalRoute.of(context);
    if (route != null && route.isCurrent) {
      context.read<AlbumBloc>().add(LoadAlbumsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 4,
        title: const Text(
          'Albums',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const LoadingIndicator();
          } else if (state is AlbumLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                return AlbumTile(
                  album: album,
                  onTap: () => context.push('/album/${album.id}'),
                );
              },
            );
          } else if (state is AlbumError) {
            return core_error.ErrorMessage(
              message: state.message,
              onRetry: () => context.read<AlbumBloc>().add(LoadAlbumsEvent()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

