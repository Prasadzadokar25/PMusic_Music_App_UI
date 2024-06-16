// Not prat of project

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends StatefulWidget {
  @override
  const Player({super.key});
  @override
  State createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = const Duration();
  Duration _position = const Duration();
  PlayerState _playerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  void _playPause() {
    if (_playerState == PlayerState.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(UrlSource(
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    }
  }

  void _seek(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Song Title',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Artist Name',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () {
                      // Handle previous
                    },
                  ),
                  IconButton(
                    icon: Icon(_playerState == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: _playPause,
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {
                      // Handle next
                    },
                  ),
                ],
              ),
            ],
          ),
          Slider(
            value: _position.inSeconds.toDouble(),
            min: 0.0,
            max: _duration.inSeconds.toDouble(),
            onChanged: (double value) {
              setState(() {
                _seek(value);
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_position.toString().split('.').first),
              Text(_duration.toString().split('.').first),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
