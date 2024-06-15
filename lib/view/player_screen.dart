import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerPage extends StatefulWidget {
  List songsList;
  int currentSongIndex;
  MusicPlayerPage(
      {required this.songsList, required this.currentSongIndex, super.key});

  @override
  State<MusicPlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<MusicPlayerPage> {
  Duration _position = const Duration();
  Duration _duration = const Duration();
  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState _playerState = PlayerState.stopped;

  late StreamSubscription<Duration> _durationSubscription;
  late StreamSubscription<Duration> _positionSubscription;
  late StreamSubscription<PlayerState> _playerStateSubscription;

  @override
  void initState() {
    super.initState();
    _audioPlayer.play(AssetSource('music/Pirates Of The Caribbean.mp3'));
    _durationSubscription = _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _positionSubscription = _audioPlayer.onPositionChanged.listen((Duration p) {
      _position = p;
      setState(() {});
      if (_position == _duration) {
        increaceCurrentSongIndex();
      }
    });

    _playerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (mounted) {
        setState(() {
          _playerState = state;
        });
      }
    });
  }

  void _playPause() async {
    if (_playerState == PlayerState.playing) {
      _audioPlayer.pause();
    } else {
      // _audioPlayer.play(UrlSource(
      //     'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
      final result =
          _audioPlayer.play(AssetSource('music/Pirates Of The Caribbean.mp3'));
      if (true) {
        setState(() {
          _playerState = PlayerState.playing;
        });
      }
    }
  }

  void _seek(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _durationSubscription.cancel();
    _positionSubscription.cancel();
    _playerStateSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void increaceCurrentSongIndex() {
    if (widget.currentSongIndex == widget.songsList.length - 1) {
      widget.currentSongIndex = 0;
    } else {
      widget.currentSongIndex++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: screenHeight * 0.633,
                  width: screenWidth,
                  child: Image.asset(
                    widget.songsList[widget.currentSongIndex].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.631,
                  left: 20,
                  child: Container(
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(18, 18, 18, 1),
                          blurRadius: 60,
                          spreadRadius: 80,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.565,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth * 0.6,
                        child: Column(
                          children: [
                            Text(
                              widget.songsList[widget.currentSongIndex].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color.fromRGBO(230, 154, 21, 1),
                              ),
                            ),
                            const Text(
                              "Youlakou",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: Color.fromRGBO(230, 154, 21, 1),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _position.toString().split('.').first,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          _duration.toString().split('.').first,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    min: 0.0,
                    max: _duration.inSeconds.toDouble(),
                    thumbColor: const Color.fromRGBO(230, 154, 21, 1),
                    inactiveColor: const Color.fromRGBO(217, 217, 217, 0.19),
                    activeColor: const Color.fromRGBO(230, 154, 21, 1),
                    value: _position.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        _seek(value);
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        highlightColor: const Color.fromARGB(30, 248, 248, 248),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.loop_rounded,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        highlightColor: const Color.fromARGB(30, 248, 248, 248),
                        onPressed: () {
                          if (widget.currentSongIndex == 0) {
                            widget.currentSongIndex = 0;
                          } else {
                            widget.currentSongIndex--;
                          }
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        highlightColor: const Color.fromARGB(30, 248, 248, 248),
                        onPressed: _playPause,
                        icon: CircleAvatar(
                          radius: 25,
                          child: Icon(
                            _playerState == PlayerState.playing
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 40,
                          ),
                        ),
                      ),
                      IconButton(
                        highlightColor: const Color.fromARGB(30, 248, 248, 248),
                        onPressed: increaceCurrentSongIndex,
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        highlightColor: const Color.fromARGB(30, 248, 248, 248),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_up_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
