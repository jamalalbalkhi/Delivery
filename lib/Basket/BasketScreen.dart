import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Services/api/auth.dart';
import '../shared/components/constantes.dart';
class Basketscreen extends StatefulWidget {
  @override
  State<Basketscreen> createState() => _BasketscreenState();
}
class _BasketscreenState extends State<Basketscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shoppingCart.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: shoppingCart.length,
        itemBuilder: (context, index) {
          final item = shoppingCart[index];
          return Card(
            child: ListTile(
              leading: Image.network(item.photo??"", width: 50, height: 50),
              title: Text(item.name??""),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: ${item.price}'),
                  Text('count: ${item.count}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.check_circle, color: Colors.green),
                    onPressed: () async{
                      await showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return CupertinoAlertDialog(
                                title: Text("Order"),
                                // content: Row(
                                //   children: [
                                //     IconButton(
                                //       onPressed: () {
                                //         setState(() {
                                //           item.quantity++;
                                //         });
                                //       },
                                //       icon: Icon(Icons.add),
                                //     ),
                                //     SizedBox(width: 10),
                                //     Text("Quantity: ${item.quantity}"),
                                //     SizedBox(width: 10),
                                //     IconButton(
                                //       onPressed: () {
                                //         if(item.quantity>0)
                                //         setState(() {
                                //           item.quantity--;
                                //         });
                                //       },
                                //       icon: Icon(Icons.exposure_minus_1),
                                //     ),
                                //   ],
                                // ),
                                actions: [
                                  TextButton(
                                    onPressed: () async{
                                      setState((){
                                        if (item.quantity > 0) {
                                          orders.add(item);
                                          item.count = item.count! - item.quantity;
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('No more ${item.name} in stock!'),
                                            ),
                                          );
                                        }
                                      });
                                      Get.close(0);
                                      await createOrder([item]);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('${item.name} ordered!'),
                                        ),
                                      );
                                    },
                                    child: Text('Save'),
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
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        shoppingCart.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('${item.name} removed!')),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed:()async{
        if(shoppingCart.isNotEmpty) {
          await createOrder(shoppingCart);
          shoppingCart.clear();
        }
      },child: Icon(Icons.request_page),  ),
    );
  }}