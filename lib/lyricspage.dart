import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class LyricsPage extends StatefulWidget {
  final String title;
  final String lyrics;
  final String audioFile;

  const LyricsPage({
    super.key,
    required this.title,
    required this.lyrics,
    required this.audioFile,
  });

  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Listen to audio duration
    _audioPlayer.onDurationChanged.listen((duration) {
      if (!mounted) return;
      setState(() {
        totalDuration = duration;
      });
    });

    // Listen to audio position
    _audioPlayer.onPositionChanged.listen((position) {
      if (!mounted) return;
      setState(() {
        currentPosition = position;
      });
    });

    // Handle when audio completes
    _audioPlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() {
        isPlaying = false;
        currentPosition = Duration.zero;
      });
    });
  }

  Future<void> _togglePlayPause() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(AssetSource('audio/${widget.audioFile}'));
      }
      if (!mounted) return;
      setState(() => isPlaying = !isPlaying);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error playing audio: $e')),
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // Make app bar transparent to see the background
        backgroundColor: Colors.transparent, 
        elevation: 0, 
      ),
      // This extends the background image behind the AppBar
      extendBodyBehindAppBar: true, 
      body: Stack(
        // 1. Use a Stack to layer widgets
        children: [
          // --- LAYER 1: THE BACKGROUND ---
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/nath.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    // ignore: deprecated_member_use
                    Colors.black.withOpacity(0.4), BlendMode.darken),
              ),
            ),
          ),

          // --- LAYER 2: YOUR CONTENT ---
          Padding(
            // We use padding here instead of on the main container
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Add space to avoid the (now transparent) AppBar
                SizedBox(height: kToolbarHeight + 40), 
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      widget.lyrics,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white54,
                      value: currentPosition.inSeconds.toDouble(),
                      max: totalDuration.inSeconds.toDouble() > 0
                          ? totalDuration.inSeconds.toDouble()
                          : 1,
                      onChanged: (value) async {
                        await _audioPlayer
                            .seek(Duration(seconds: value.toInt()));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(currentPosition),
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14),
                        ),
                        Text(
                          _formatDuration(totalDuration),
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      iconSize: 80,
                      color: Colors.white,
                      icon: Icon(isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill),
                      onPressed: _togglePlayPause,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isPlaying ? 'Playing...' : 'Paused',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}