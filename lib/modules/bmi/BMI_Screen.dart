import 'dart:math';

import 'package:flutter/material.dart';

import '../bmiresult/bmi2.dart';

class BmiScreen extends StatefulWidget {

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120;
  int weight=65;
  int age=20;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('BMI Calculator',style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){

                        setState(() {
                          isMale=true;

                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('images/R.jpg'),
                            height: 90,
                            width: 90,),
                            SizedBox(
                              height: 10,
                            ),
                            Text('MALE',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                      
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:isMale ?Colors.blue.shade200: Colors.grey[400],
                      
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded (
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;

                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                             Image(image: AssetImage('images/8czr7L9Ki.png'),
                              width: 100,
                               height: 100,),
                            SizedBox(
                              height: 10,
                            ),
                            Text('FEMALE',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],

                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:isMale? Colors.grey[400]:Colors.blue.shade200,

                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
             horizontal: 20,
    ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HIGHT',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),),
                        SizedBox(
                          width: 5,
                        ),
                        Text('cm',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),),


                      ],
                    ),
                    Slider(value: height,
                        max: 220,
                        min: 80,

                        onChanged:(value)
                        {
                          setState(() {
                            height=value  ;
                          });

                          print(value.round() );
                        }
                    ),




                  ],

                ),
              ),
            ),
          ),
          Expanded  (
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('$age',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: 'age+',
                              mini: true,
                              child: Icon(Icons.add),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: 'age-',
                              mini: true,
                              child: Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),


                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text('$weight',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                            ],
                          )
                        ],
                      ),


                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            height: 50,
            width:double.infinity ,
            child: MaterialButton(

              color: Colors.grey,
                onPressed: (){
                double result= weight/pow(height/100, 2);
                print(result.round());
                Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Bmi2(
                    weight: weight,
                    age: age,
                    result: result.round(),
                    ismale: isMale ,

                  ),
                  ),

                );

                },
              child: Text('CALCULATE',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),

            ),
          ),
        ],
      ),
    );
  }
}
