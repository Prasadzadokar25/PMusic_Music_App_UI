import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _FavoriteState();
}

class _FavoriteState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        body: Center(
          child: Text(
            "profile page",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
