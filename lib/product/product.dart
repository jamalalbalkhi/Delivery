import 'package:flutter/material.dart';

import '../categories/categoriesScreen.dart';
import '../productdiscreption/productdiscreption.dart';


class itemsScreen extends StatelessWidget {
  final String storename;
  List<products> pro;



  itemsScreen({
    required this.pro,

    required this.storename
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            storename
        ),
      ),
      body:ListView.separated(
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),


        itemCount: pro.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              title:Text(
                pro[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ) ,
              leading:CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(pro[index].image),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => discribthionScreen(
                    p:pro[index] ,


                  )),
                );

              },
            ),
          );
        },
      ),
    );
  }
}