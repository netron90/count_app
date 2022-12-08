import 'dart:async';

import 'package:count_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CountApp(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kStartGradientColor, kEndGradientColor],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/splash.png'),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "Count App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kActiveDoneBgColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                )
              ],
            ),
          )),
    ));
  }
}

//
// MaterialApp(
// title: kAppName,
// home: SafeArea(
// child: Scaffold(
// body: Expanded(
// child: Container(
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [kStartGradientColor, kEndGradientColor],
// ),
// ),
// child: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Image(
// image: AssetImage('assets/images/splash.png'),
// ),
// Text(
// "Count App",
// textAlign: TextAlign.center,
// style: TextStyle(
// color: kActiveDoneBgColor,
// fontWeight: FontWeight.w600,
// fontSize: 24.0),
// )
// ],
// ),
// ),
// ),
// ),
// ),
// ),
// );
