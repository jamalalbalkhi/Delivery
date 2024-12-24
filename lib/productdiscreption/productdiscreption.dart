import 'package:flutter/material.dart';

import '../categories/categoriesScreen.dart';


class discribthionScreen extends StatelessWidget {
  final products p;




  discribthionScreen({
    required this.p,


  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Describtion Product'
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        p.image,
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(height: 10),

                      Text('Product Name: ${p.name}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 5),
                      Text('Describtion: ${p.describthion}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                      SizedBox(height: 5),
                      Text('Product Price: ${p.price}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 5),
                      Text('Product Quantity: ${p.quantity}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ]
                )
            )
        )
    );
  }
}