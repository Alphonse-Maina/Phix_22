import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/theme_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isDarkMode = prefs.getBool('isDarkMode');

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider()..toggleTheme(isDarkMode ?? false),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light(),  // Light theme
          darkTheme: ThemeData.dark(), // Dark theme
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomeScreen(),
            '/home': (context) => MainScreen(),
            '/settings': (context) => SettingsScreen(),
          },
        );
      },
    );
  }
}
