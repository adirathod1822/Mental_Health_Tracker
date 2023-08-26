import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/navBarScreen/home.dart';
import 'package:flutter_application_1/otherScreens/mood.dart';
import 'package:flutter_application_1/lib/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/lib/ans.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future addUserName(String name, String mail) async {
    await FirebaseFirestore.instance.collection('users').doc('$email').set({
      'firstName': name,
      'mail': mail,
    });
  }

  Future resetPassword(String mail) async {
        showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email:_emailController.text.trim() 
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
    Navigator.pop(context);
    Navigator.pop(context);
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password reset link send! check your email")));
  }

  void signUserIn(var email, var password) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.pop(context);
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool alreadylog = false;
  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;


@override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

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
                  login
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/images/login.svg",
                            height: 250.0,
                            width: 250.0,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/images/signup.svg",
                            height: 250.0,
                            width: 250.0,
                          ),
                        ),
                  // ======== Full Name ========
                  login
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                          child: TextFormField(
                            // obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              hintText: 'Enter Full Name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Full Name';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                fullname = value!;
                                finalname = fullname;
                                username.add(finalname);
                              });
                            },
                          ),
                        ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(
                  //     controller: _NameController,
                  //     decoration:InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(25.0)),
                  //       hintText: 'mood',
                  //     ) ,
                  //   ),
                  // ),
                  // ======== Email ========
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
                          login ? Container() : addUserName(fullname, email);
                          // addUserMail(email);
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
                  login
                      ? GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Text(
                                            'Enter your mail to get reset link',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 108, 74, 192)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,8,0,8),
                                            child: TextField(
                                              controller: _emailController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25.0),
                                                ),
                                                hintText: 'Enter Email',
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                resetPassword(email);
                                              },
                                              child: Text(
                                                'Send link',
                                                style: TextStyle(fontSize: 20),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 108, 74, 192)),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
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
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // signUserIn(email, password);
                            login
                                ? AuthServices.signinUser(
                                    email, password, context)
                                : AuthServices.signupUser(
                                    email, password, fullname, context);
                          }
                        },
                        child: Text(
                          login ? 'Login' : 'Signup',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Text(login
                          ? "Don't have an account? Signup"
                          : "Already have an account? Login")),
                  login
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(100, 8, 20, 8),
                          child: Row(
                            children: [
                              Text(
                                'Or login with ',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
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
                                    User? user =
                                        FirebaseAuth.instance.currentUser;
                                    if (user != null) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MoodPage()));
                                    }
                                    setState(() {
                                      googleAlreadylogged = true;
                                      alreadylog = true;
                                    });
                                    if (alreadylog) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('You are logged in!!')));
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
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
