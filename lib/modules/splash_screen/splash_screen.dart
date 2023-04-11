import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:croshez/main.dart';
import 'package:croshez/modules/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Welcome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          // color: Colors.amber[600],
          child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              height: size.height,
              child: Image.asset(
                "assets/images/bg_img.png",
                fit: BoxFit.fill,
              )),
          Positioned(
              top: 0.3 * size.height,
              left: 0.35 * size.width,
              child: Image.asset(
                "assets/images/logo.png",
                height: 100,
              )),
        ],
      )),
    );
  }
}
