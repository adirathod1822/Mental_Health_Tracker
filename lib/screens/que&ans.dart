import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib/ans.dart';
import 'package:flutter_application_1/ques/queeample.dart';
import 'package:flutter_application_1/screens/function.dart';
import 'package:flutter_application_1/screens/outputPage.dart';

class QueandAns extends StatefulWidget {
  QueandAns({super.key});

  @override
  State<QueandAns> createState() => _QueandAnsState();
}

class _QueandAnsState extends State<QueandAns> {
  bool _flag = true;
  int btni = -1;
  int que = 1;
  PageController? _controller;
  String btnText = "Next Question";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Q.${que} ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 147, 118, 227),
        ),
        body: PageView.builder(
          controller: _controller!,
          onPageChanged: (page) {
            if (page == questions.length - 1) {
              setState(() {
                btnText = "End Survey";
              });
            }
          },
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width - 21,
                        child: Text(
                          "${questions[index].question}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    margin:
                        EdgeInsets.only(bottom: 20.0, left: 12.0, right: 12.0),
                    child: ElevatedButton(
                      onPressed: () => setState(() {
                        _flag = !_flag;
                        btni = i;
                      }),
                      style: i == btni
                          ? ElevatedButton.styleFrom(
                              backgroundColor: _flag
                                  ? Color.fromARGB(255, 147, 118, 227)
                                  : Colors.blue,
                            )
                          : ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 147, 118, 227),
                            ),
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20.0,
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (_controller!.page?.toInt() == questions.length - 1) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => mlModel(
                              age: minmaxscaler(8),
                              gender: answers[1],
                              family_history: answers[2],
                              benefits: answers[3],
                              care_options: answers[4],
                              anonymity: answers[5],
                              leave: answers[6],
                              work_interfere: answers[7])));
                    } else {
                      if (_flag == false) {
                        _controller!.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linearToEaseOut);
                        setState(() {
                          _flag = !_flag;
                          que++;
                          if (index < 9) {
                            answers.add(questions[index]
                                .answers!
                                .entries
                                .toList()[btni]
                                .value);
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please Select a option')));
                      }
                    }
                  },
                  shape: const StadiumBorder(),
                  fillColor: Color.fromARGB(255, 50, 126, 231),
                  padding: EdgeInsets.all(18.0),
                  elevation: 0.0,
                  child: Text(
                    btnText,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          },
          itemCount: questions.length,
        ),
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
