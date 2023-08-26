import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib/ans.dart';
import 'package:flutter_application_1/screens/outputPage.dart';
import 'package:flutter_application_1/screens/que&ans.dart';
import 'package:google_fonts/google_fonts.dart';

class track extends StatefulWidget {
   track({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;


  @override
  State<track> createState() => _trackState();
}

class _trackState extends State<track> {
   late User _user;
  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      child: Column(
            children: [
              
              Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Container(
                  height: 60,
                  width: 60,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(80,20,30,0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  child: Text(
                              "Lets find out",
                              style: GoogleFonts.courgette(
                                  fontSize: 40, fontWeight: FontWeight.w700),
                            )
                  // child: Text('Lets find out, ',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
                ),
              ),Padding(
                padding: const EdgeInsets.fromLTRB(80,0,30,5),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  
                  child: Text(
                              "how its going",
                              style: GoogleFonts.courgette(
                                  fontSize: 40, fontWeight: FontWeight.w700),
                            )
                  
                ),
              ),
         Padding(
           padding: const EdgeInsets.fromLTRB(0,10,0,8.0),
           child: Container(
                    // color: Colors.blue,
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/images/panda.jpg'),
                  ),
         ),
           RawMaterialButton(
                  onPressed: () {
                    answers.clear();
                    print(answers);
                    //Navigating the the Quizz Screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QueandAns(),
                        ));
                  },
                  shape: const StadiumBorder(),
                  fillColor: Color.fromARGB(255, 147, 118, 227),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
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
        ],
          ),
          onWillPop: () async { 
      final value  = await showDialog<bool>(
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