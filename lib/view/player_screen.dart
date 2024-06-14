import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  Duration _position = const Duration();
  Duration _duration = const Duration();
  AudioPlayer _audioPlayer = AudioPlayer();
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
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
                    "assets/images/272cf15a08dcca3bd22e258e7635e9c2 1.png",
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
                        child: const Column(
                          children: [
                            Text(
                              "Alone in the Abyss",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color.fromRGBO(230, 154, 21, 1),
                              ),
                            ),
                            Text(
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
                    const Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(
                            Icons.logout,
                            color: Color.fromRGBO(230, 154, 21, 1),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: screenWidth,
              child: Column(
                children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.loop_rounded,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.music_note,
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
