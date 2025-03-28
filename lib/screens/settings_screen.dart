import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          // Theme Section
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text("Dark Mode"),
            trailing: Switch(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),
          Divider(), // Separator

          // Account Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text("Account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Login"),
            onTap: () {
              // TODO: Implement navigation to login screen
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              // TODO: Implement navigation to profile screen
            },
          ),
        ],
      ),
    );
  }
}
