import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        body: Center(
          child: Text(
            "SearchPageSearchPage",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
