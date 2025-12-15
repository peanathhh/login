import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricsPage extends StatefulWidget {
  final String title;
  final String lyrics;
  final String youtubeUrl;

  const LyricsPage({
    super.key,
    required this.title,
    required this.lyrics,
    required this.youtubeUrl,
  });

  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  late YoutubePlayerController _controller;

  bool isPlaying = false;
  bool isPlayerReady = false;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    if (videoId == null) {
      throw Exception("Invalid YouTube URL");
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: true,
        controlsVisibleAtStart: false,
        disableDragSeek: false,
        showLiveFullscreenButton: false,
      ),
    );

    _controller.addListener(() {
      if (!mounted || !isPlayerReady) return;
      setState(() {
        isPlaying = _controller.value.isPlaying;
      });
    });
  }

  void _togglePlayPause() {
    if (!isPlayerReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Player is still loading...")),
      );
      return;
    }

    if (isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final position = _controller.value.position;
    final duration = _controller.metadata.duration;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/nath.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // AUDIO-ONLY YouTube (hidden video)
          Opacity(
  opacity: 0.0,
  child: YoutubePlayer(
    controller: _controller,
    width: 1,
    onReady: () {
      setState(() {
        isPlayerReady = true;
      });
    },
  ),
),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
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
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Slider(
                  activeColor: Colors.white,
                  inactiveColor: Colors.white54,
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds > 0
                      ? duration.inSeconds.toDouble()
                      : 1,
                  onChanged: (value) {
                    if (!isPlayerReady) return;
                    _controller.seekTo(
                      Duration(seconds: value.toInt()),
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(position),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Text(
                      _formatDuration(duration),
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                IconButton(
                  iconSize: 80,
                  color: Colors.white,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                  ),
                  onPressed: _togglePlayPause,
                ),

                const SizedBox(height: 10),

                Text(
                  isPlaying ? 'Playing...' : 'Paused',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
