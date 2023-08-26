import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib/ans.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/navBarScreen/activity.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart';
import 'track.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required User user, required this.mood})
      : _user = user,
        super(key: key);
  final String mood;
  final User _user;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> wig = [
    Text('home'),
    Text('hom1e'),
    Text('home11'),
    Text('ho2me'),
  ];
  int _selectedIndex = 0;
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 147, 118, 227),
          elevation: 0,
          toolbarHeight: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Color.fromARGB(255, 221, 208, 255),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 147, 118, 227),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism_outlined),
              label: 'Acitivity',
              backgroundColor: Color.fromARGB(255, 147, 118, 227),
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.track_changes),
              label: 'Track',
              backgroundColor: Color.fromARGB(255, 147, 118, 227),
              // backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 147, 118, 227),
              // backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: Column(
          children: [
            if (_selectedIndex == 0)
              firstHome(
                user: _user,
                moodf: widget.mood,
              ),
            if (_selectedIndex == 1) activity(),
            if (_selectedIndex == 2) track(user: _user),
            if (_selectedIndex == 3) profile(user: _user),
          ],
        ));
  }
}

String finalname = '';

class firstHome extends StatefulWidget {
  const firstHome({Key? key, required User user, required this.moodf})
      : _user = user,
        super(key: key);
  final String moodf;
  final User _user;

  @override
  State<firstHome> createState() => _firstHomeState();
}

class _firstHomeState extends State<firstHome> {
  String _currentDate = '';

  late User _user;
  String mood = '';
  dynamic email = '';

  @override
  void initState() {
    _getCurrentDate();
    mood = widget.moodf;
    _user = widget._user;
    super.initState();
  }

  void _getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE');
    final formattedDate = formatter.format(now);
    setState(() {
      _currentDate = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: WillPopScope(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // HeartBeatAnimation
                  Container(
                    height: 60,
                    width: 60,
                    // child:HeartBeatAnimation(),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  _user.photoURL == null
                      ? SizedBox(
                          width: 45,
                          height: 45,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: SizedBox(
                            width: 45,
                            height: 45,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                _user.photoURL!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      _user.displayName == null
                          ? Text(
                              "Hello, Buddy",
                              style: GoogleFonts.dancingScript(
                                  fontSize: 50, fontWeight: FontWeight.w700),
                            )
                          : Text(
                              "Hello, "+_user.displayName!.split(" ").first,
                              style: GoogleFonts.dancingScript(
                                  fontSize: 50, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 221, 208, 255),
                            border: Border.all(
                              color: Colors.white,
                              // backgroundColor = Color.fromARGB(255, 221, 208, 255),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          height: 200,
                          width: MediaQuery.of(context).size.width - 100,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(moods[mood].toString())),
                              ),
                              Text(
                                "I'm feeling $mood today!!",
                                style: GoogleFonts.courgette(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 221, 208, 255),
                          border: Border.all(
                            color: Colors.white,
                            // backgroundColor = Color.fromARGB(255, 221, 208, 255),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Past 7 days Mood',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              children: [
                                _currentDate == "Monday"
                                    ? emojiReact(
                                        path: moods[mood].toString(),
                                        name: 'Mon',
                                      )
                                    : emojiReact(
                                        path: 'assets/images/emoji/happy.png',
                                        name: 'Mon',
                                      ),
                                _currentDate == "Tuesday"
                                    ? emojiReact(
                                        path: moods[mood].toString(),
                                        name: 'Tues',
                                      )
                                    : emojiReact(
                                        path: 'assets/images/emoji/excited.png',
                                        name: 'Tues',
                                      ),
                                _currentDate == "Wednesday"
                                    ? emojiReact(
                                        path: moods[mood].toString(),
                                        name: 'Wed',
                                      )
                                    : emojiReact(
                                        path: 'assets/images/emoji/excited.png',
                                        name: 'wed',
                                      ),
                                _currentDate == "Thursday"
                                    ? emojiReact(
                                        path: moods[mood].toString(),
                                        name: 'Tues',
                                      )
                                    : emojiReact(
                                        path: 'assets/images/emoji/bored.png',
                                        name: 'thrus',
                                      ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                              child: Row(
                                children: [
                                  _currentDate == "Friday"
                                      ? emojiReact(
                                          path: moods[mood].toString(),
                                          name: 'Fri',
                                        )
                                      : emojiReact(
                                          path: 'assets/images/emoji/happy.png',
                                          name: 'Fri',
                                        ),
                                  _currentDate == "Saturday"
                                      ? emojiReact(
                                          path: moods[mood].toString(),
                                          name: 'Sat',
                                        )
                                      : emojiReact(
                                          path:
                                              'assets/images/emoji/excited.png',
                                          name: 'sat',
                                        ),
                                  _currentDate == "Sunday"
                                      ? emojiReact(
                                          path: moods[mood].toString(),
                                          name: 'Sun',
                                        )
                                      : emojiReact(
                                          path: 'assets/images/emoji/happy.png',
                                          name: 'Sun',
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        onWillPop: () async {
          final value = await showDialog<bool>(
            context: context,
            builder: (c) => AlertDialog(
              title: Text('Warning'),
              content: Text('Do you really want to exit?'),
              actions: [
                ElevatedButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(c, true),
                ),
                ElevatedButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(c, false),
                ),
              ],
            ),
          );
          if (value != null) {
            return Future.value(value);
          } else {
            return Future.value(false);
          }
        },
      ),
    );
  }
}

class emojiReact extends StatefulWidget {
  emojiReact({super.key, required this.path, required this.name});
  final String path;
  final String name;
  final int dailymood = 0;
  @override
  State<emojiReact> createState() => _emojiState();
}

class _emojiState extends State<emojiReact> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 8, 4, 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 208, 255),
              border: Border.all(
                color: Colors.white,
                // backgroundColor = Color.fromARGB(255, 221, 208, 255),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 60 ,
            width: 60 ,
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
