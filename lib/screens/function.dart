import 'dart:convert';
import 'package:flutter_application_1/lib/ans.dart';
import 'package:flutter_application_1/screens/outputPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

makePrediction(double age, int Gender, int family_history, int benefits,
    int care_options, int anonymity, int leave, int work_interfere) async {
  // final response = await http.get(
  var data = await fetchdata('https://adi08.pythonanywhere.com/predict?ip=' +
      '{$age}' +
      '&ip=' +
      '{$Gender}' +
      '&ip=' +
      '{$family_history}' +
      '&ip=' +
      '{$benefits}' +
      '&ip=' +
      '{$care_options}' +
      '&ip=' +
      '{$anonymity}' +
      '&ip=' +
      '{$leave}' +
      '&ip=' +
      '{$work_interfere}');
}

double minmaxscaler(int age) {
  int min = 18, max = 72, newmax = 1, newmin = 0;
  double newage = 0;
  newage = (((age - min) / (max - min)) * (newmax - newmin)) + newmin;
  return newage;
}

Future<dynamic> fetchdata(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

class mlModel extends StatefulWidget {
  mlModel(
      {super.key,
      required this.age,
      required this.gender,
      required this.family_history,
      required this.benefits,
      required this.care_options,
      required this.anonymity,
      required this.leave,
      required this.work_interfere});
  final double age;
  final int gender;
  final int family_history;
  final int benefits;
  final int care_options;
  final int anonymity;
  final int leave;
  final int work_interfere;

  @override
  State<mlModel> createState() => _mlModelState();
}

class _mlModelState extends State<mlModel> {
  double Age = 0;
  int gender = 0;
  int family_history = 0;
  int benefits = 0;
  int care_options = 0;
  int anonymity = 0;
  int leave = 0;
  int work_interfere = 0;
  @override
  void initState() {
    Age = minmaxscaler(answers[0]);
    gender = answers[1];
    family_history = answers[2];
    benefits = answers[3];
    care_options = answers[4];
    anonymity = answers[5];
    leave = answers[6];
    work_interfere = answers[7];
    url =
        'https://adi08.pythonanywhere.com/predict?ip=$Age&ip=$gender&ip=$family_history&ip=$benefits&ip=$care_options&ip=$anonymity&ip=$leave&ip=$work_interfere';

    // TODO: implement initState
    super.initState();
  }

  String url = '';
  var data;
  String output = 'Null';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Prediction'),
          backgroundColor: Color.fromARGB(255, 221, 208, 255),
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: WillPopScope(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 20, 30, 0),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.blue,
                    child: Text(
                      "Lets find out",
                      style: GoogleFonts.courgette(
                          fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 30, 5),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 8.0),
                child: Container(
                  // color: Colors.blue,
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/images/panda.jpg'),
                ),
              ),
              RawMaterialButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  data = await fetchdata(url);
                  var decoded = jsonDecode(data);
                  setState(() {
                    output = decoded['output'];
                  });
                  Navigator.pop(context);
                  print(answers);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          outputPage(output: int.parse(output))));
                },
                shape: const StadiumBorder(),
                fillColor: Color.fromARGB(255, 147, 118, 227),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    "Result",
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
        ));
  }
}
