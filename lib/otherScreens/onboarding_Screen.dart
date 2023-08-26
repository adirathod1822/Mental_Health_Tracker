
import 'package:flutter/material.dart';
import 'package:apoapps_onboarding_screen/flutter_onboarding.dart';
import 'package:apoapps_onboarding_screen/sk_onboarding_model.dart';
import 'package:apoapps_onboarding_screen/sk_onboarding_screen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/otherScreens/login.dart';
import 'package:flutter_application_1/otherScreens/loginFrom.dart';
import 'package:flutter_application_1/otherScreens/mood.dart';
import 'package:flutter_application_1/screens/mainmenu.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override

  final pages = [
    ApoappsOnboardingModel(
        title: '           Empower Your Mind',
        description:
        'Unlocking Mental Health Support through our App',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboard3.png'),
    ApoappsOnboardingModel(
        title: '           Embracing Balance',
        description:
        ' Your Journey to Mental Wellbeing with Our App',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboard2.png'),
    ApoappsOnboardingModel(
        title: '           Navigating Wellness',
        description: 'A Comprehensive Guide to Our Mental Health App',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboard1.png'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        
        bgColor: Colors.white,
        themeColor: Color.fromARGB(255, 231, 149, 107),
        pages: pages,
        skipClicked: (value) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthPage()));
          print("Skip");
        },
        getStartedClicked: (value) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthPage()));
          //print("Get Started");
        },
      ),

    );
  }
}
