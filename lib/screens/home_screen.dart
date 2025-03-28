import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea( // 🛡️ Prevents overlap with status bar
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // 🔹 "All Songs" Section
            SectionHeader(title: "All Songs"),
            _buildSongTile("Song 1", "Artist 1"),
            _buildSongTile("Song 2", "Artist 2"),
            _buildSongTile("Song 3", "Artist 3"),

            // 🔹 "Playlists" Section
            SectionHeader(title: "Playlists"),
            _buildPlaylistTile("My Favorite Songs"),
            _buildPlaylistTile("Chill Vibes"),

            // 🔹 "Recently Played" Section
            SectionHeader(title: "Recently Played"),
            _buildSongTile("Recent 1", "Artist X"),
            _buildSongTile("Recent 2", "Artist Y"),
          ],
        ),
      ),
    );
  }

  /// 🔹 Helper to create a song ListTile
  Widget _buildSongTile(String title, String artist) {
    return ListTile(
      leading: Icon(Icons.music_note, color: Colors.blue),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(artist),
      trailing: Icon(Icons.more_vert),
      onTap: () {
        // TODO: Play song
      },
    );
  }

  /// 🔹 Helper to create a playlist ListTile
  Widget _buildPlaylistTile(String name) {
    return ListTile(
      leading: Icon(Icons.playlist_play, color: Colors.orange),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.more_vert),
      onTap: () {
        // TODO: Open playlist
      },
    );
  }
}

/// 🔹 Reusable Section Header
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
