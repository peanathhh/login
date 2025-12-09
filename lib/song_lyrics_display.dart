import 'package:flutter/material.dart';

class SongLyricsDisplay extends StatelessWidget {
  const SongLyricsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Song Lyrics")),
      body: const Center(
        child: Text("Welcome to Song Lyrics Display!"),
      ),
    );
  }
}
