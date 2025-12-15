import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddSongDialog extends StatefulWidget {
  const AddSongDialog({super.key});

  @override
  State<AddSongDialog> createState() => _AddSongDialogState();
}

class _AddSongDialogState extends State<AddSongDialog> {
  final titleController = TextEditingController();
  final artistController = TextEditingController();
  final lyricsController = TextEditingController();
  final youtubeController = TextEditingController();

  bool isSaving = false;

  Future<void> saveSong() async {
    if (titleController.text.isEmpty ||
        artistController.text.isEmpty ||
        youtubeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    setState(() => isSaving = true);

    await FirebaseFirestore.instance.collection('songs').add({
      'title': titleController.text.trim(),
      'artist': artistController.text.trim(),
      'lyrics': lyricsController.text.trim(),
      'youtubeUrl': youtubeController.text.trim(),
      'timestamp': FieldValue.serverTimestamp(),
      'isFavorite': false,
    });

    setState(() => isSaving = false);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Song added successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Song (YouTube)"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: artistController,
              decoration: const InputDecoration(labelText: "Artist"),
            ),
            TextField(
              controller: lyricsController,
              decoration: const InputDecoration(labelText: "Lyrics"),
              maxLines: 4,
            ),
            TextField(
              controller: youtubeController,
              decoration: const InputDecoration(
                labelText: "YouTube URL",
                hintText: "https://youtube.com/watch?v=xxxx",
              ),
            ),
            if (isSaving)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: saveSong,
          child: const Text("Save"),
        ),
      ],
    );
  }
}
