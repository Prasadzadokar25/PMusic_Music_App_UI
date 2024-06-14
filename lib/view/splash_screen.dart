import 'package:flutter/material.dart';
import 'landing_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: height,
              width: width,
            ),
            Image.asset("assets/images/44 1.png"),
            Positioned(
              left: width * 0.097,
              top: height * 0.5,
              right: width * 0.097,
              child: const SizedBox(
                child: Text(
                  "Dancing between The shadows Of rhythm",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.71,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contex) {
                    return const LandingPage();
                  }));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 46, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(223, 0, 0, 0),
                            spreadRadius: 30,
                            blurRadius: 60)
                      ]),
                  height: height * 0.058,
                  width: width * 0.6326,
                  alignment: Alignment.center,
                  child: const Text(
                    "Get started",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color.fromRGBO(9, 19, 19, 1),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.79,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(21)),
                    border: Border.all(
                        color: const Color.fromRGBO(255, 61, 0, 1), width: 1.5),
                  ),
                  height: height * 0.058,
                  width: width * 0.6326,
                  alignment: Alignment.center,
                  child: const Text(
                    "Continue with Email",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color.fromRGBO(255, 61, 0, 1),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: width * 0.19,
              top: height * 0.87,
              right: width * 0.19,
              child: const SizedBox(
                child: Text(
                  "by continuing you agree to terms of services and  Privacy policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.5,
                    color: Color.fromRGBO(135, 135, 135, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
