import 'package:flutter/material.dart';
import 'package:pmusic/view/localfiles.dart';
import 'package:pmusic/view/playlist_screen.dart';
import 'package:pmusic/view/favorite_screen.dart';
import 'package:pmusic/view/home_page.dart';
import 'search_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 2;

  List<StatefulWidget> pages = const [
    LocalFilesMusic(),
    SearchPage(),
    HomePage(),
    CartPage(),
    FavoritePage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkPermissionForInitialPage();
  }

  void _checkPermissionForInitialPage() async {
    if (_selectedIndex == 0) {
      await _handleStoragePermission();
    }
  }

  void onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      await _handleStoragePermission();
    }
  }

  Future<void> _handleStoragePermission() async {
    bool permissionGranted = await _requestPermission();
    if (!permissionGranted) {
      // Show a dialog or snackbar to inform the user about the denied permission
      print("Permission is not granted");
    } else {
      print("Permission is granted");
    }
  }

  Future<bool> _requestPermission() async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var result = await Permission.manageExternalStorage.request();
      return result.isGranted;
    } else {
      var status = await Permission.storage.status;
      if (status.isGranted) {
        return true;
      } else {
        var result = await Permission.storage.request();
        return result.isGranted;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
        selectedItemColor: const Color.fromRGBO(230, 154, 21, 1),
        unselectedItemColor: const Color.fromRGBO(157, 178, 206, 1),
        onTap: onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: "Local disc",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_rounded),
            label: "Playlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}
