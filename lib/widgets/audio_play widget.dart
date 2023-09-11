import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';


// class AudioPlayerWidget extends StatefulWidget {
//   const AudioPlayerWidget({
//     Key? key,
//     required this.audioUrl,
//   }) : super(key: key);

//   final String audioUrl;

//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }

// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   AudioPlayer _audioPlayer = AudioPlayer();
//   PlayerState _playerState = PlayerState.stopped;
//   double _sliderValue = 0.0;
//   Duration _duration = Duration();
//   Duration _position = Duration();

//   @override
//   void initState() {
//     super.initState();

//     _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
//       setState(() {
//         _playerState = state;
//       });
//     });

//     _audioPlayer.onDurationChanged.listen((Duration duration) {
//       setState(() {
//         _duration = duration;
//         _sliderValue = 0.0; // Reset slider value when duration changes
//       });
//     });

//     _audioPlayer.onPositionChanged.listen((Duration position) {
//       setState(() {
//         _position = position;
//         _sliderValue = _position.inMilliseconds.toDouble();
//       });
//     });
//   }

//   Future<void> _playAudio() async {
//     await _audioPlayer.play(UrlSource(widget.audioUrl));
//   }

//   Future<void> _pauseAudio() async {
//     await _audioPlayer.pause();
//   }

//   Future<void> _stopAudio() async {
//     await _audioPlayer.stop();
//   }

//   void _seekAudio(double value) {
//     final newPosition = Duration(milliseconds: value.toInt());
//     _audioPlayer.seek(newPosition);
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   String _formatDuration(Duration duration) {
//     final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: Get.height*0.04,
//       width: Get.width*0.4,
//       child: Column(
//         children: <Widget>[
//           // SizedBox(height: 10),
//           Row(
            
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(
//                   Icons.play_arrow,
//                   size: 20.0,
//                   color: _playerState == PlayerState.playing
//                       ? Colors.blue
//                       : Colors.grey,
//                 ),
//                 onPressed: _playAudio,
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.pause,
//                   size: 20.0,
//                   color: _playerState == PlayerState.paused
//                       ? Colors.blue
//                       : Colors.grey,
//                 ),
//                 onPressed: _pauseAudio,
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.stop,
//                   size: 20.0,
//                   color: _playerState == PlayerState.stopped
//                       ? Colors.blue
//                       : Colors.grey,
//                 ),
//                 onPressed: _stopAudio,
//               ),
//             ],
//           ),
//           if (_duration.inMilliseconds > 0) // Only show slider if duration is available
//             Slider(
              
//               value: _sliderValue,
//               onChanged: _seekAudio,
//               min: 0.0,
//               max: _duration.inMilliseconds.toDouble(),
//               activeColor: Colors.blue,
//               inactiveColor: Colors.grey,
//             ),
//           // Text(
//           //   '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
//           //   style: TextStyle(fontSize: 8.0),
//           // ),
//         ],
//       ),
//     );
//   }
// }
