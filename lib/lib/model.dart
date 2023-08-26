// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/function.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// // class predict{
// //   // ['Age', 'Gender', 'family_history', 'benefits', 'care_options', 'anonymity', 'leave', 'work_interfere']
// //   int age=0;
// //   int Gender = 0;
// //   int family_history=0;
// //   int benefits=0;
// //   int care_options=0;
// //   int anonymity=0;
// //   int leave=0;
// //   int work_interfere=0;
// //   predict(int age,int Gender,int family_history,int benefits,int care_options,int anonymity,int leave,int work_interfere){
// // //     this.age=age;
// // //   }
//   Future<dynamic> makePrediction(double age,int Gender,int family_history,int benefits,int care_options,int anonymity,int leave,int work_interfere) async {
//   final response = await http.get(
//     Uri.parse('https://adi08.pythonanywhere.com/predict?ip='+'{$age}'+'&ip='+'{$Gender}'+'&ip='+'{$family_history}'+'&ip='+'{$benefits}'+'&ip='+'{$care_options}'+'&ip='+'{$anonymity}'+'&ip='+'{$leave}'+'&ip='+'{$work_interfere}'),
//   );

//   if (response.statusCode == 200) {
//     final decodedResponse = json.decode(response.body);
//     return decodedResponse['prediction'];
//   } else {
//     throw Exception('Failed to make prediction');
//   }
// }

// // Example usage
// // void main() async {
// //   try {
// //     final prediction = await makePrediction();
// //     print('Prediction: $prediction');
// //   } catch (e) {
// //     print('Error: $e');
// //   }
// // }

// // }


// class mlModel extends StatefulWidget {
//   const mlModel({super.key});

//   @override
//   State<mlModel> createState() => _mlModelState();
// }

// class _mlModelState extends State<mlModel> {
//   int Age = 0;
//   int Gender = 0;
//   int family_history = 0;
//   int benefits = 0;
//   int care_options = 0;
//   int anonymity = 0;
//   int leave = 0;
//   int work_interfere = 0;

//   String url = 'http://10.0.2.2:5000/predict?ip=0.340909&ip=1&ip=1&ip=2&ip=1&ip=0&ip=0&ip=4';
//   var data;
//   String output = 'Null'; 
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('Prediction'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//         child: Column(children: [
//           TextButton(onPressed: () async{
//             // final prediction = await makePrediction(0.340909,1,1,2,1,0,0,4);
//             // data = await fetchdata('https://adi08.pythonanywhere.com/predict?ip=0.159091&ip=1&ip=0&ip=0&ip=1&ip=0&ip=0&ip=0');
//             // var decoded = jsonDecode(data);
//             // setState(() {
//             //   output = decoded['output'];
//             // });
//           }, child: Text('Enter'),),
//           Text(output),
//         ]),
//       )
//         ],
//       ),
//     );
//   }
// }