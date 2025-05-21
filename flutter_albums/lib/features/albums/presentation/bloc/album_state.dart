// Album states
import 'package:equatable/equatable.dart';
import '../../data/models/album_model.dart';
import '../../data/models/photo_model.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<AlbumModel> albums;

  AlbumLoaded(this.albums);

  @override
  List<Object?> get props => [albums];
}

class AlbumDetailsLoaded extends AlbumState {
  final AlbumModel album;
  final List<PhotoModel> photos;

  AlbumDetailsLoaded({required this.album, required this.photos});

  @override
  List<Object?> get props => [album, photos];
}

class AlbumError extends AlbumState {
  final String message;

  AlbumError(this.message);

  @override
  List<Object?> get props => [message];
}
