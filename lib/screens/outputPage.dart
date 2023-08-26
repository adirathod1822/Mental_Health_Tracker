import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/professionals.dart';
import '../lib/ans.dart';

class outputPage extends StatefulWidget {
  outputPage({super.key, required this.output});
  int output;

  @override
  State<outputPage> createState() => _outputPageState();
}

class _outputPageState extends State<outputPage> {
  bool help = true;
  int op = 0;
  @override
  void initState() {
    // TODO: implement initState
    op = widget.output;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 147, 118, 227),
          title: Text(
            'Result',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 50, 8, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 300,
                  width: 300,
                  // color: Colors.black,
                  child: Image.asset('assets/images/doc.png'),
                ),
              ),
              op == 1
                  ? Column(
                      children: [
                        Text(
                          'You need a',
                          style: TextStyle(fontSize: 35),
                        ),
                        Text(
                          'professional help!',
                          style: TextStyle(fontSize: 35),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          'You are keeping a good',
                          style: TextStyle(fontSize: 35),
                        ),
                        Text(
                          'mental Health 😊',
                          style: TextStyle(fontSize: 35),
                        ),
                      ],
                    ),
              op == 1
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        height: 100,
                        child: Center(
                          child: RawMaterialButton(
                            onPressed: () {
                              op == 1
                                  ? Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              professionalsPage()))
                                  : Navigator.pop(context);
                            },
                            shape: const StadiumBorder(),
                            fillColor: Color.fromARGB(255, 147, 118, 227),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 24.0),
                              child: Text(
                                "Get Professional Help",
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
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: SizedBox(
                        height: 100,
                        child: Center(
                          child: RawMaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: const StadiumBorder(),
                            fillColor: Color.fromARGB(255, 147, 118, 227),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 24.0),
                              child: Text(
                                "End Survey",
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
        final value = await showDialog<bool>(
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

class doccard extends StatelessWidget {
  final String name;
  final String specialization;
  final String experience;
  final String location;
  final String image;

  doccard(
      {required this.name,
      required this.specialization,
      required this.experience,
      required this.location,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(height: 8.0),
            Text(
              specialization,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.man_2_outlined, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(experience),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.location_city, color: Colors.grey),
                SizedBox(width: 8.0),
                Text(location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
