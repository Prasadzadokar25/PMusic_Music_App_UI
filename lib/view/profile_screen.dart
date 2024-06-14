import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _FavoriteState();
}

class _FavoriteState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "profile",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
