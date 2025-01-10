import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/products.dart';

import '../Services/api/auth.dart';

class EditOrderScreen extends StatefulWidget {
  int? id;
  EditOrderScreen({super.key,this.id});

  @override
  State<EditOrderScreen> createState() => _EditOrderScreenState();
}

class _EditOrderScreenState extends State<EditOrderScreen> {
  List<product> orderProducts=[];
  var loading=false;
  @override
  void initState() {
    super.initState();
    getOrderProducts();
  }
  getOrderProducts()async{
    setState(() {
      loading=true;
    });
    var data=await getOrderProducts_endpoint(widget.id);
    setState(() {
      orderProducts=data;
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Order'),),
      body: orderProducts.isEmpty
          ? Center(
        child: Text(
          'the order is empty',
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: orderProducts.length,
        itemBuilder: (context, index) {
          final item = orderProducts[index];
          return Card(
            child: ListTile(
              leading: Image.network(item.photo??"", width: 50, height: 50),
              title: Text(item.name??""),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: ${item.price}'),
                  Text('Quantity: ${item.quantity}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async{
                      await showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return CupertinoAlertDialog(
                                title: Text("edit quantity"),
                                content: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                    SizedBox(width: 10),
                                    Text("Quantity: ${item.quantity}"),
                                    SizedBox(width: 10),
                                    IconButton(
                                      onPressed: () {
                                        if(item.quantity>1)
                                        setState(() {
                                          item.quantity--;
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
                                        if (item.quantity > 0) {
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('No more ${item.name} in stock!'),
                                            ),
                                          );
                                        }
                                      });
                                      Get.close(0);
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
                        orderProducts.removeAt(index);
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
        if(orderProducts.isNotEmpty) {
          //await createOrder(orderProducts);
          await Edit_order_endpoint(widget.id,orderProducts);
          Get.back();
        }
      },child: Icon(Icons.save),  ),
    );
  }}

