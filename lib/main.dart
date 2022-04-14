import 'package:RickyMortyApp/src/pages/character_detail_page.dart';
import 'package:RickyMortyApp/src/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick & Morty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white 
      ),
      home: const HomePage(),
      initialRoute: "Home", 
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'Home':
            return CupertinoPageRoute(
                builder: (_) => const HomePage(), settings: settings);
          case 'CharacterDetail':
            return CupertinoPageRoute(
                builder: (_) => const CharacterDetailPage(), settings: settings);
        }
      }
    );
  }
}