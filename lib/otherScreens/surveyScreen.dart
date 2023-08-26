import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/que&ans.dart';
import '../lib/ans.dart';

class surveyScreen extends StatefulWidget {
  const surveyScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<surveyScreen> createState() => _surveyScreenState();
}

class _surveyScreenState extends State<surveyScreen> {
  late User _user;
  bool _isSigningOut = false;
  bool _flag = true;
  int btni = -1;
  int que = 1;
  // var btncolor = AppColor.secondaryColor;
  PageController? _controller;
  String btnText = "Next Question";
  @override
  void initState() {
    _user = widget._user;
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        title: Text("Metal Health Tracker"),
        // title: Text('Q.${que} '),
        backgroundColor: Color.fromARGB(255, 50, 126, 231),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [

            _user.photoURL != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: Color.fromARGB(255, 50, 126, 231),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 20,
                          color: Color.fromARGB(255, 50, 126, 231),
                        ),
                      ),
                    ),
                  ),
                   Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40,left: 10),
              child: Text(
                 _user.displayName!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ),
              ],
            ),
                   Container(
              // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 350,
              width:400,
              child: Image.asset('assets/images/blue.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 100,
                child: Center(
                  child: RawMaterialButton(
                    onPressed: () {
                      //Navigating the the Quizz Screen

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QueandAns(),
                          ));
                    },
                    shape: const StadiumBorder(),
                    fillColor: Color.fromARGB(255, 50, 126, 231),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        "Start the Survey",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
     onWillPop: () async { 
      final value  = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('Warning'),
        content: Text('Do you really want to exit'),
        actions: [
          ElevatedButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(c, true),
          ),
          ElevatedButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(c, false),
          ),
        ],),
      );
      if(value!=null){
        return Future.value(value);
      }
      else {
        return Future.value(false);
      }
      },
    );
  }
}