import 'package:flutter/material.dart';

class AllMusicBuilder extends StatefulWidget {
  final String appBarTitle;
  final List musicList;
  const AllMusicBuilder({
    required this.appBarTitle,
    required this.musicList,
    super.key,
  });

  @override
  State<AllMusicBuilder> createState() => _AllMusicBuilderState();
}

class _AllMusicBuilderState extends State<AllMusicBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 8,
            childAspectRatio: 0.65,
          ),
          itemCount: widget.musicList.length,
          itemBuilder: (context, index) {
            return buildDiscographyItemcard(widget.musicList[index]);
          },
        ),
      ),
    );
  }

  Widget buildDiscographyItemcard(discographyItem) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.1726,
            width: screenWidth * 0.3195,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child:
                    Image.asset(discographyItem.imageUrl, fit: BoxFit.cover)),
          ),
          const SizedBox(height: 5),
          SizedBox(
            child: Text(
              //maxLines: 1,
              discographyItem.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color.fromRGBO(203, 200, 200, 1),
              ),
            ),
          ),
          SizedBox(
            child: Text(
              discographyItem.year,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Color.fromRGBO(132, 125, 125, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}