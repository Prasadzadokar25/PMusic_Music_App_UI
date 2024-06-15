import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Favorite",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(212, 208, 208, 1),
                    ),
                  ),
                  Text(
                    "46 songs",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(212, 208, 208, 1),
                    ),
                  ),
                ],
              ),
              Row(
                children: [],
              )
            ],
          )),
        ));
  }
}
