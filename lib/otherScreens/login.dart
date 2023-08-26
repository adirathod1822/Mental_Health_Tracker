import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib/auth.dart';
import 'package:flutter_application_1/otherScreens/mood.dart';
import 'package:flutter_svg/svg.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool alreadylog = false;
  String email = '';
  String password = '';
  String fullname = '';
  // bool login = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 221, 208, 255),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/login.svg",
                      height: 250.0,
                      width: 250.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      key: ValueKey('email'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        hintText: 'Enter Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please Enter valid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),
                  ),
                  // ======== Password ========
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      key: ValueKey('password'),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Enter Password',
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please Enter Password of min length 6';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: 150,
                    child: ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        //   backgroundColor:
                        // ),
                        onPressed: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              AuthServices.signinUser(email, password, context);
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
                          }
                          // User? user = FirebaseAuth.instance.currentUser;
                          
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => MoodPage()));
                        
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          // login = !login;
                        });
                      },
                      child: Text("Don't have an account? Signup")),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 8, 20, 8),
                    child: Row(
                      children: [
                        Text(
                          'Or login with ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 108, 74, 192)),
                        ),
                        Container(
                          height: 50,
                          width: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(20, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            onPressed: () async {
                              await googleAuth().googleLogin(context);
                              User? user = FirebaseAuth.instance.currentUser;
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => MoodPage()));
                              }
                              setState(() {
                                alreadylog = true;
                              });
                              if (alreadylog) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('You are logged in!!')));
                              }
                            },
                            child: Container(
                                height: 30,
                                width: 30,
                                child: SvgPicture.asset(
                                    'assets/images/Google.svg')),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
