import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchMusicWidget extends StatefulWidget {
  const SearchMusicWidget({super.key});

  @override
  _SearchMusicWidgetState createState() => _SearchMusicWidgetState();
}

class _SearchMusicWidgetState extends State<SearchMusicWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _videos = [];
  bool _isLoading = false;

  static const String apiKey = "AIzaSyDMgiVArTnWjT23wggD1p54AzYuFKXbehg"; // Replace with your API key

  Future<void> _searchMusic() async {
    setState(() {
      _isLoading = true;
    });

    final String query = _searchController.text.trim();
    if (query.isEmpty) return;

    final String apiUrl =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=$apiKey&maxResults=10";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _videos = data['items']; // List of YouTube videos
          _isLoading = false;
        });
      } else {
        throw Exception("Failed to load videos");
      }
    } catch (e) {
      print("Error fetching videos: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search for a song...",
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _searchMusic,
              ),
            ),
          ),
        ),
        _isLoading
            ? CircularProgressIndicator()
            : Expanded(
          child: ListView.builder(
            itemCount: _videos.length,
            itemBuilder: (context, index) {
              var video = _videos[index];
              var videoId = video['id']['videoId'];
              var title = video['snippet']['title'];
              var thumbnail = video['snippet']['thumbnails']['high']['url'];

              return ListTile(
                leading: Image.network(thumbnail, width: 80, height: 50),
                title: Text(title),
                onTap: () {
                  print("YouTube Video ID: $videoId");
                  // Later, integrate yt-dlp to extract the direct audio link
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
