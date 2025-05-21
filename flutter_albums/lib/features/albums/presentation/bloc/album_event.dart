// Album events
import 'package:equatable/equatable.dart';

abstract class AlbumEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAlbumsEvent extends AlbumEvent {}

class LoadAlbumDetailsEvent extends AlbumEvent {
  final int albumId;

  LoadAlbumDetailsEvent(this.albumId);

  @override
  List<Object?> get props => [albumId];
}
