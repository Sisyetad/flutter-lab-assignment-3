// Album BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';
import '../../data/repositories/album_repository.dart';
import '../../data/models/album_model.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;
  List<AlbumModel> _cachedAlbums = [];

  AlbumBloc({required this.repository}) : super(AlbumInitial()) {
    on<LoadAlbumsEvent>(_onLoadAlbums);
    on<LoadAlbumDetailsEvent>(_onLoadAlbumDetails);
  }

  Future<void> _onLoadAlbums(
    LoadAlbumsEvent event,
    Emitter<AlbumState> emit,
  ) async {
    emit(AlbumLoading());
    try {
      _cachedAlbums = await repository.fetchAlbums();
      emit(AlbumLoaded(_cachedAlbums));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }

  Future<void> _onLoadAlbumDetails(
    LoadAlbumDetailsEvent event,
    Emitter<AlbumState> emit,
  ) async {
    emit(AlbumLoading());
    try {
      final selectedAlbum = _cachedAlbums.firstWhere(
        (album) => album.id == event.albumId,
      );
      final photos = await repository.fetchPhotosForAlbum(event.albumId);
      emit(AlbumDetailsLoaded(album: selectedAlbum, photos: photos));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }
}
