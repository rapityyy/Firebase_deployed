import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';

import 'main_menu.dart';

Future<void> main() async {
  runApp(const MyApp());

  const double desiredWidth = 1100; // Adjust the width as needed
  const double desiredHeight = 900; // Adjust the height as needed

  await DesktopWindow.setWindowSize(const Size(desiredWidth, desiredHeight));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2048 Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: '2048 Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MainMenu();
  }
}
