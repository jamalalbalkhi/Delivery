import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/homework/project1.dart';

class result extends StatelessWidget {
  final product m;
  result(
      {
        required this.m
      }
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,

        title: Text(
          'PROUDUCT DISECREBTION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                m.image,
                width: 300,
                height: 300,
              ),
              SizedBox(height: 5),
          
              Text('Product ID: ${m.id}',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 5),
              Text('Product Name: ${m.name}',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
          
              SizedBox(height: 5),
              Text('Description: ${m.discreption}',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 30),
          
              Container(
                color: Colors.grey,
                width: double.infinity,
                child: MaterialButton(
                   onPressed: (){
                    Navigator.pop(context);
                  },
                  child:Text(
                    'BACK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ) ,
                ),
              ),
          
            ],
          
          ),
        ),
      ),
    );
  }
}