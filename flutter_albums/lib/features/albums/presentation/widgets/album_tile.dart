// Album tile widget
import 'package:flutter/material.dart';
import '../../data/models/album_model.dart';

class AlbumTile extends StatelessWidget {
  final AlbumModel album;
  final VoidCallback onTap;

  const AlbumTile({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      leading: CircleAvatar(child: Text(album.id.toString())),
      onTap: onTap,
    );
  }
}
