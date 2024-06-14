import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            child: Image.asset(
                "assets/images/272cf15a08dcca3bd22e258e7635e9c2 1.png"),
          )
        ],
      ),
    );
  }
}
