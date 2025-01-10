import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Services/api/auth.dart';
import 'package:untitled/models/products.dart';
import '../shared/components/constantes.dart';
class discribthionScreen extends StatelessWidget {
  final product p;
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
                      Image.network(
                        p.photo??"",
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(height: 10),

                      Text('Product Name: ${p.name}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 5),
                      Text('Describtion: ${p.description}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                      SizedBox(height: 5),
                      Text('Product Price: ${p.price}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 5),
                      Text('Product Quantity: ${p.count}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 20),


                      Center(
                        child: Row(

                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart_rounded, size: 50, color: Colors.orange),
                              onPressed: () async{
                                if (!shoppingCart.contains(p)) {
                                  await showCupertinoDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState) {
                                        return CupertinoAlertDialog(
                                          title: Text("Quantity"),
                                          content: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    p.quantity++;
                                                  });
                                                },
                                                icon: Icon(Icons.add),
                                              ),
                                              SizedBox(width: 10),
                                              Text("Quantity: ${p.quantity}"),
                                              SizedBox(width: 10),
                                              IconButton(
                                                onPressed: () {
                                                  if(p.quantity>0)
                                                    setState(() {
                                                      p.quantity--;
                                                    });
                                                },
                                                icon: Icon(Icons.exposure_minus_1),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () async{
                                                setState((){
                                                  if (int.parse(p.count.toString()) > 0) {
                                                    orders.add(p);
                                                  } else {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('No more ${p.name} in stock!'),
                                                      ),
                                                    );
                                                  }
                                                });
                                                Get.close(0);
                                                shoppingCart.add(p);
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('${p.name} has been added to the cart!'),
                                                  ),
                                                );
                                              },
                                              child: Text('Add'),
                                            ),
                                            SizedBox(width: 10),
                                            TextButton(
                                              onPressed: () {
                                                Get.close(0);
                                              },
                                              child: Text('Cancel'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  );

                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${p.name} is already in the cart!'),
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(
                                onPressed: () async{
                                  await showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState) {
                                          return CupertinoAlertDialog(
                                            title: Text("Quantity"),
                                            content: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      p.quantity++;
                                                    });
                                                  },
                                                  icon: Icon(Icons.add),
                                                ),
                                                SizedBox(width: 10),
                                                Text("Quantity: ${p.quantity}"),
                                                SizedBox(width: 10),
                                                IconButton(
                                                  onPressed: () {
                                                    if(p.quantity>0)
                                                      setState(() {
                                                        p.quantity--;
                                                      });
                                                  },
                                                  icon: Icon(Icons.exposure_minus_1),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () async{
                                                  setState((){
                                                    if (int.parse(p.count.toString()) > 0) {
                                                      orders.add(p);
                                                    } else {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text('No more ${p.name} in stock!'),
                                                        ),
                                                      );
                                                    }
                                                  });
                                                  await createOrder([p]);
                                                  p.quantity=0;
                                                  Get.close(0);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('${p.name} has been Orderd'),
                                                    ),
                                                  );
                                                },
                                                child: Text('Order'),
                                              ),
                                              SizedBox(width: 10),
                                              TextButton(
                                                onPressed: () {
                                                  Get.close(0);
                                                },
                                                child: Text('Cancel'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                  // if (int.parse(p.) > 0) {
                                  //   orders.add(p);
                                  //   p.quantity = (int.parse(p.quantity) - 1).toString();
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(content: Text('${p.name} has been ordered!')),
                                  //   );
                                  // } else {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(content: Text('Out of stock!')),
                                  //   );
                                  // }
                                },
                                child: Text('ORDER', style: TextStyle(color: Colors.white)),
                              ),
                            ),


                          ],
                        ),
                      ),

                    ]
                )
            )
        )
    );
  }
}