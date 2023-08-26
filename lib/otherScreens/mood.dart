import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/navBarScreen/home.dart';
import 'loginFrom.dart';
import '../lib/ans.dart';
import '../lib/auth.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 115, 200),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
              child: Text(
                'How is your mood?',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 107, 59, 220),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 670,
              width: MediaQuery.of(context).size.width,
              //  color: Color.fromARGB(255, 221, 208, 255),

              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 208, 255),
                border: Border.all(
                  color: Colors.white,
                  // backgroundColor = Color.fromARGB(255, 221, 208, 255),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          emoji(
                            path: moods['Happy'].toString(),
                            name: 'Happy',
                          ),
                          emoji(
                            path: moods['Excited'].toString(),
                            name: 'Excited',
                          ),
                          // emoji(path: 'assets/images/emoji/imTheBoss.png',name: 'Happy',),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          emoji(
                            path: moods['Moodless'].toString(),
                            name: 'Moodless',
                          ),
                          emoji(
                            path: moods['Bossy'].toString(),
                            name: 'Bossy',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          emoji(
                            path: moods['Sad'].toString(),
                            name: 'Sad',
                          ),
                          emoji(
                            path: moods['Angry'].toString(),
                            name: 'Angry',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          emoji(
                            path: moods['Confused'].toString(),
                            name: 'Confused',
                          ),
                          emoji(
                            path: moods['Bored'].toString(),
                            name: 'Bored',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          emoji(
                            path: moods['Crying'].toString(),
                            name: 'Crying',
                          ),
                        ],
                      ),
                    ],
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

class emoji extends StatefulWidget {
  emoji({super.key, required this.path, required this.name});
  String path;
  String name;
  int dailymood = 0;
  @override
  State<emoji> createState() => _emojiState();
}

class _emojiState extends State<emoji> {
  String mood = '';
  double i = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FirebaseAuth.instance.signOut();
        // googleAuth().logout();
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Home(user: user, mood: widget.name)));
        }
        setState(() {
          mood = moods[widget.name].toString();
        });
      },
      child: Column(
        children: [
          Container(
            height: 100 ,
            width: 100 ,
            child: Image.asset(widget.path),
          ),
          Text(
            widget.name,
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 107, 59, 220),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
