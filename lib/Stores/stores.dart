import 'package:flutter/material.dart';

import '../categories/categoriesScreen.dart';
import '../product/product.dart';


class storesScreen extends StatelessWidget {
  final String categoryname;
  List<stores> stor;


  storesScreen({
    required this.stor,

    required this.categoryname
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            categoryname
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


        itemCount: stor.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              title:Text(
                stor[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ) ,
              leading:CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(stor[index].image),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => itemsScreen(
                          pro: stor[index].prod,
                          storename: stor[index].name)
                  ),
                );

              },
            ),
          );
        },
      ),
    );
  }
}