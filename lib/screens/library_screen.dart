import 'package:flutter/material.dart';

import 'Search_Music_Widget.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox( height: 50),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(
                hintText: "Search music...",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Tab Bar
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.library_music), text: "Local Music"),
                      Tab(icon: Icon(Icons.cloud), text: "Cloud Music"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Placeholder for Local Music
                        Center(
                          child: Text(
                            "Local Music",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        // Placeholder for Cloud Music
                        SearchMusicWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
