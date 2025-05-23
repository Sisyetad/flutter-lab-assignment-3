import 'package:flutter_albums/features/albums/domain/usecase/fetch_albums.dart';
import 'package:flutter_albums/features/albums/domain/usecase/fetch_photos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';
import '../../data/models/album_model.dart';
import '../../data/models/photo_model.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumUsecase albumUsecase;
  final FetchPhotos fetchPhotosUsecase;

  AlbumBloc({
    required this.albumUsecase,
    required this.fetchPhotosUsecase,
  }) : super(AlbumInitial()) {
    on<LoadAlbumsEvent>(_onLoadAlbums);
    on<LoadAlbumDetailsEvent>(_onLoadAlbumDetails);
  }

  Future<void> _onLoadAlbums(
      LoadAlbumsEvent event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final albums = await albumUsecase.call();
      emit(AlbumLoaded(albums.map((e) => AlbumModel.fromEntity(e)).toList()));
    } catch (e) {
      emit(AlbumError('Failed to load albums'));
    }
  }

  Future<void> _onLoadAlbumDetails(
      LoadAlbumDetailsEvent event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final albums = await albumUsecase.call();
      final album = albums.firstWhere((a) => a.id == event.albumId);

      final photos = await fetchPhotosUsecase.fetchPhotos();
      final filteredPhotos = photos
          .where((photo) => photo.albumId == event.albumId)
          .map((e) => PhotoModel.fromEntity(e))
          .toList();

      emit(AlbumDetailsLoaded(
        album: AlbumModel.fromEntity(album),
        photos: filteredPhotos,
      ));
    } catch (e) {
      emit(AlbumError('Failed to load album details'));
    }
  }
}
