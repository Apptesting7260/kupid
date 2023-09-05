

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  AudioPlayerWidget({required this.audioUrl});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  late StreamSubscription<PlayerState> playerStateSubscription;

  @override
  void initState() {
    super.initState();

    // Listen for audio player state changes
    playerStateSubscription = audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else if (state == PlayerState.stopped || state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  Future<void> _playAudio() async {
    try {
      if (!isPlaying) {
        final Uri uri = Uri.parse(widget.audioUrl); // Convert string URL to Uri
        await audioPlayer.play(UrlSource(widget.audioUrl)); // Pass the Uri as the source
        setState(() {
          isPlaying = true;
        });
      } else {
        await audioPlayer.pause();
        setState(() {
          isPlaying = false;
        });
      }
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  @override
  void dispose() {
    playerStateSubscription.cancel(); // Cancel the subscription
    audioPlayer.dispose(); // Dispose the audio player when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _playAudio,
      child: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        size: 36.0,
        color: Colors.blue,
      ),
    );
  }
}