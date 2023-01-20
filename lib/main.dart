import 'package:flutter/material.dart';

import 'package:what_to_watch/screens/category_screen.dart';
import 'package:what_to_watch/screens/home_screen.dart';
import 'package:what_to_watch/screens/profile_screen.dart';

void main() => runApp(MainApp());
const String HOME_SCREEN = '/';
const String PROFILE_SCREEN = '/profile';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
          // bodyMedium: TextStyle(fontSize: 12),
          // titleLarge: TextStyle(fontSize: 12),
        ),
      ),
      // home: CategoryScreen(),
      routes: {
        HOME_SCREEN : (ctx) => HomeScreen(),
        PROFILE_SCREEN : (ctx) => ProfileScreen(),
      },
    );
  }
}