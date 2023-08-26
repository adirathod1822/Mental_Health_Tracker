import 'package:flutter/material.dart';
import 'package:flutter_application_1/lib/ans.dart';

import 'outputPage.dart';

class professionalsPage extends StatefulWidget {
  const professionalsPage({super.key});

  @override
  State<professionalsPage> createState() => _professionalsPageState();
}

class _professionalsPageState extends State<professionalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.logout_outlined))],
          title: const Text('Professionals'),
          backgroundColor: Color.fromARGB(255, 221, 208, 255),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: doc.length,
          itemBuilder: (context, index) {
            return doccard(
  name: doc[index].name.toString(),
  specialization: doc[index].specialization.toString(),
  experience: doc[index].Experience.toString(),
  location: doc[index].location.toString(),
  image:doc[index].image.toString(),
);
          },
          
          ),
    );
  }
}