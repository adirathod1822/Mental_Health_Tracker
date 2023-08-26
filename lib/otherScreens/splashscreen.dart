import 'dart:async';
import 'package:flutter_application_1/animations/heartbeat.dart';
import 'package:flutter_application_1/otherScreens/onboarding_Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardingScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),

          // Image.asset("assets/cloud.png", height: 20.0,width: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(width: 120,),
              Container(
                  height: 200.0, width: 200.0, child: HeartBeatAnimation()),
              // Image.asset("assets/images/logo.png", height: 200.0,width: 200.0,),
            ],
          ),
          // Text("Welcome to", style: TextStyle(color: Colors.black, fontSize: 40),),
          Text(
            "Mental Health",
            style: TextStyle(
                color: Color.fromARGB(255, 109, 28, 175), fontSize: 50),
          ),
          Text(
            "Tracker",
            style: TextStyle(
                color: Color.fromARGB(255, 109, 28, 175), fontSize: 40),
          ),
        ],
      ),
    );
  }
}
