import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pmusic/model/discograph_item_model.dart';
import 'package:pmusic/model/popular_singles_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final images = [
    'assets/images/111 1.png',
    'assets/images/111 1.png',
    'assets/images/111 1.png',
  ];

  List<DiscographyItem> discographyItem = const [
    DiscographyItem(
      name: "Dead inside",
      year: "2020",
      imageUrl: "assets/images/Rectangle 32.png",
    ),
    DiscographyItem(
      name: "Alone",
      year: "2023",
      imageUrl: "assets/images/Rectangle 38.png",
    ),
    DiscographyItem(
      name: "Dead inside",
      year: "2020",
      imageUrl: "assets/images/Rectangle 32.png",
    ),
    DiscographyItem(
      name: "Alone",
      year: "2023",
      imageUrl: "assets/images/Rectangle 38.png",
    ),
  ];
  List<PolularSinglesItem> popularSingleItem = const [
    PolularSinglesItem(
      name: "We Are Chaos",
      year: "2020",
      imageUrl: "assets/images/Rectangle 34.png",
      description: "Easy Living",
    ),
    PolularSinglesItem(
      name: "Smile",
      year: "2023",
      imageUrl: "assets/images/Rectangle 38.png",
      description: "Berredchild",
    ),
    PolularSinglesItem(
      name: "Dead inside",
      year: "2020",
      imageUrl: "assets/images/Rectangle 34.png",
      description: "Easy Living",
    ),
    PolularSinglesItem(
      name: "Alone",
      year: "2023",
      imageUrl: "assets/images/Rectangle 38.png",
      description: "Berredchild",
    ),
    PolularSinglesItem(
      name: "Dead inside",
      year: "2020",
      imageUrl: "assets/images/Rectangle 34.png",
      description: "Easy Living",
    ),
    PolularSinglesItem(
      name: "Alone",
      year: "2023",
      imageUrl: "assets/images/Rectangle 38.png",
      description: "Berredchild",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: ((context, index, realIndex) {
                final imageUrl = images[index];
                return buildImage(imageUrl, index);
              }),
              options: CarouselOptions(
                //animateToClosest: false,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.415,
                //aspectRatio: 20 / 16,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            buildPageIndicator(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Row(
                    children: [
                      const Text(
                        "Discograohy",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 46, 0, 1),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(248, 162, 69, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: discographyItem.length,
                    itemBuilder: (context, index) {
                      return buildDiscographyItemcard(discographyItem[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 0,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Popular singles",
                        style: TextStyle(
                          fontSize: 14.4,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(203, 200, 200, 1),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(248, 162, 69, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Column(
                  children: List.generate(
                    popularSingleItem.length,
                    (index) {
                      return buildPopularSingleItemcard(
                        popularSingleItem[index],
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(String imageUrl, int index) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: 367,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: screenHeight * 0.41,
          left: 20,
          child: Container(
            width: screenWidth * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(24, 24, 24, 1),
                  blurRadius: 200,
                  spreadRadius: 77,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 224,
          left: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "A.L.O.N.E",
                style: TextStyle(
                  letterSpacing: 0,
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 46, 0, 1),
                    borderRadius: BorderRadius.all(Radius.circular(21)),
                  ),
                  height: 37,
                  width: 127,
                  alignment: Alignment.center,
                  child: const Text(
                    "SubScribe",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(9, 19, 19, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPageIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images.length,
      effect: const ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Color.fromRGBO(255, 61, 0, 1),
      ),
    );
  }

  Widget buildDiscographyItemcard(DiscographyItem discographyItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child:
                    Image.asset(discographyItem.imageUrl, fit: BoxFit.cover)),
          ),
          const SizedBox(height: 5),
          SizedBox(
            child: Text(
              maxLines: 1,
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

  Widget buildPopularSingleItemcard(PolularSinglesItem polularSinglesItem) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 14, left: 14, top: 7, bottom: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.083,
            width: screenWidth * 0.1630,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.asset(
                polularSinglesItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  polularSinglesItem.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color.fromRGBO(203, 200, 200, 1),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      polularSinglesItem.year,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Color.fromRGBO(132, 125, 125, 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 2.2,
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    child: Text(
                      polularSinglesItem.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Color.fromRGBO(132, 125, 125, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: screenHeight * 0.083,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
