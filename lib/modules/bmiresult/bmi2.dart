import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi2 extends StatelessWidget {
  final int  result;
  final bool ismale;
  final int age;
  final int weight;


  Bmi2({
     required this.result,
    required  this.ismale,
    required this.age,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Text('Gender :${ismale?'male':'female'}',style:
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            Text('AGE :$age',
              style:
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text('Result :$result',style:
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            Text('Weight :$weight',style:
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
     
    );
  }
}
