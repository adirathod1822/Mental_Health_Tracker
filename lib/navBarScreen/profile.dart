import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib/ans.dart';
import 'package:flutter_application_1/lib/auth.dart';
import 'package:flutter_application_1/otherScreens/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class profile extends StatefulWidget {
  const profile({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late User _user;

  bool loggedout = false;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 208, 255),
              border: Border.all(
                color: Colors.white,
                // backgroundColor = Color.fromARGB(255, 221, 208, 255),
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: (Radius.circular(50)),
                  bottomRight: (Radius.circular(50))),
            ),
            height: 330,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/bg2.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250, top: 170),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/bg2.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 280, top: 30),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/bg3.png'),
                  ),
                ),
                _user.photoURL == null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: SizedBox(
                            width: 150,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                _user.photoURL!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      child: _user.displayName == null
                          ? Text(
                              "Buddy",
                              style: GoogleFonts.dancingScript(
                                  fontSize: 50, fontWeight: FontWeight.w700),
                            )
                          : Text(
                              _user.displayName!.split(" ").first +" "+ _user.displayName!.split(" ").last.split("_").first,
                              style: GoogleFonts.dancingScript(
                                  fontSize: 50, fontWeight: FontWeight.w700),
                            ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250, left: 20),
                    child: Container(
                      child: Text(
                        _user.email!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // color: Colors.black,
          ),
          profilebuttons(name: 'Edit Profile'),
          profilebuttons(name: 'Setting'),
          profilebuttons(name: 'Help!'),
          profilebuttons(name: 'About us'),
          GestureDetector(
            onTap: () {
              googleAlreadylogged
                  ? googleAuth().logout()
                  : FirebaseAuth.instance.signOut();
              setState(() {
                if (googleAlreadylogged == true) {
                  googleAlreadylogged = false;
                }
              });
              setState(() {
                  loggedout = true;
              });
              logoutfrom(context, loggedout);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.5),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 208, 255),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    (Radius.circular(30)),
                  ),
                ),
                height: 65,
                width: MediaQuery.of(context).size.width - 60,
                child: Center(
                    child: Text('logout',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500))),
              ),
            ),
          )
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
    );
  }
}

class profilebuttons extends StatefulWidget {
  profilebuttons({super.key, required this.name});
  final String name;

  @override
  State<profilebuttons> createState() => _profilebuttonsState();
}

class _profilebuttonsState extends State<profilebuttons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 221, 208, 255),
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            (Radius.circular(30)),
          ),
        ),
        height: 65,
        width: MediaQuery.of(context).size.width - 60,
        child: Center(
            child: Text(widget.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500))),
      ),
    );
  }
}

void logoutfrom(context, bool val) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
  if (val == true) {
    Navigator.pop(context);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SplashScreen()));
  }
}
