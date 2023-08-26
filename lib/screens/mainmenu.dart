// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/navBarScreen/home.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // import 'surveyScreen.dart';
// import '../lib/auth.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class MainMenu extends StatefulWidget {
//   const MainMenu({Key? key}) : super(key: key);
//   @override
//   _MainMenuState createState() => _MainMenuState();
// }

// class _MainMenuState extends State<MainMenu> {
//   bool alreadylog = false;
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//             // vertical: 8.0,
//             // horizontal: 12.0,
//             ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // SizedBox(
//             //   height: 180,
//             // ),
//             Container(
//               padding: EdgeInsets.fromLTRB(1, 80, 1, 0),
//               height: 150,
//               child: Text(
//                 'Mental Health',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   color: Colors.black,
//                   fontSize: 48,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               // padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//               height: 80,
//               child: Text(
//                 "Tracker",
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
                  
//                   color: Color.fromARGB(255, 50, 126, 231),
//                   fontSize: 60,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//               height: 300,
//               width: 500,
//               child: Image.asset('assets/images/logo.png'),
//             ),

//             ElevatedButton.icon(
//                 icon: FaIcon(
//                   FontAwesomeIcons.google,
//                   color: Colors.white,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 50, 126, 231),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     primary: Colors.white,
//                     onPrimary: Colors.black,
//                     minimumSize: Size(80, 50)),
//                 onPressed: () async {
//                   await googleAuth().googleLogin();
//                   // if (mounted) {
//                   //   Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(
//                   //           builder: (context) => surveyScreen(user: user,)));
//                   // }
//                   User? user = FirebaseAuth.instance.currentUser;
//                   if(user!=null){
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context)=> Home(user:user))
//                     );
//                   }
//                  setState(() {
//                    alreadylog=true;
//                  });
//                  if(alreadylog){
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text('You are already logged in!!')));
//                  }
//                 },
//                 label: Text(
//                   'LogIn up with Google',
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 )),

//             // Text(userName),

// //             SizedBox(
// //   width: double.infinity,
// //   child: DefaultTextStyle(
// //     style: const TextStyle(
// //       color: Colors.black,
// //       fontSize: 20.0,
// //       // fontFamily: 'poppins',
// //     ),
// //     child: AnimatedTextKit(
// //       animatedTexts: [
// //         TypewriterAnimatedText('Embrace self-care and kindness as the foundation of your journey towards better mental health'),
// //         // TypewriterAnimatedText('Design first, then code'),
// //         // TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
// //         // TypewriterAnimatedText('Do not test bugs out, design them out'),
// //       ],
// //       onTap: () {
// //         print("Tap Event");
// //       },
// //     ),
// //   ),
// // ),
//             // ElevatedButton(
//             //     style: ElevatedButton.styleFrom(
//             //         primary: Colors.white,
//             //         onPrimary: Colors.black,
//             //         minimumSize: Size(double.infinity, 50)),
//             //     onPressed: () {},
//             //     child: Text('Google login')),
//             // alreadylog? Container(
//             //   height: 100,
//             //   child: Center(
//             //     child: RawMaterialButton(
//             //       onPressed: () {
//             //         //Navigating the the Quizz Screen
//             //         Navigator.push(
//             //             context,
//             //             MaterialPageRoute(
//             //               builder: (context) => surveyScreen(),
//             //             ));
//             //       },
//             //       shape: const StadiumBorder(),
//             //       fillColor: Color.fromARGB(255, 37, 35, 88),
//             //       child: const Padding(
//             //         padding:
//             //             EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//             //         child: Text(
//             //           "Start the Survey",
//             //           style: TextStyle(
//             //             color: Colors.white,
//             //             fontSize: 26.0,
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // ) : Container(
//             //   height: 200,
//             //   child: Center(
//             //     child: RawMaterialButton(
//             //       onPressed: () {
//             //         //Navigating the the Quizz Screen
//             //         // Navigator.push(
//             //         //     context,
//             //         //     MaterialPageRoute(
//             //         //       builder: (context) => surveyScreen(),
//             //         //     ));
//             //         googleAuth().logout();
//             //       },
//             //       shape: const StadiumBorder(),
//             //       fillColor: Color.fromARGB(255, 50, 126, 231),
//             //       child: const Padding(
//             //         padding:
//             //             EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//             //         child: Text(
//             //           "logout",
//             //           style: TextStyle(
//             //             color: Colors.white,
//             //             fontSize: 26.0,
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // ),

//             // Text('Embrace self-care and kindness as the foundation of your journey towards better mental health',style: TextStyle(fontFamily: ),),
//           ],
//         ),
//       ),
//     );
//   }
// }
