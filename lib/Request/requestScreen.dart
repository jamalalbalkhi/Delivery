import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Request/Edit_order.dart';
import 'package:untitled/models/Order.dart';
import '../../shared/components/constantes.dart';
import '../Services/api/auth.dart';
import '../categories/categoriesScreen.dart';
import '../models/products.dart';
class Requestscreen extends StatefulWidget {
  @override
  State<Requestscreen> createState() => _RequestscreenState();
}

class _RequestscreenState extends State<Requestscreen> {
  var loading=false;
  List<Order>orders=[];
  @override
  void initState() {
    super.initState();
    getOrders();
  }
  getOrders()async{
    setState(() {
      loading=true;
    });
    var data=await Order_endPoints();
    setState(() {
      orders=data;
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:loading==true?Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final product = orders[index];
              return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
              //leading: Image.network(product.photo??"", width: 50, height: 50),
                leading: Icon(Icons.add_card),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.orderStatus??""),
                  Text(product.paymentStatus??""),
                  Text('Price: ${product.finalBill}'),
                ],
              ),
              // isThreeLine: true,
              // subtitle: Text('Price: ${product.finalBill}'),
              trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // _editOrder(context, product);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>EditOrderScreen(id:product.id)));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async{

                    await  Deletrorder(product.id);
                    await getOrders();
                      setState(() {
                        // orders.remove(product);
                        // product.count =
                        //     product.count! + 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _editOrder(BuildContext context, products product) {
    int newQuantity = 1;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Modify the quantity for ${product.name}'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  newQuantity = int.tryParse(value) ?? 1;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
              ),
            TextButton(
              onPressed: () {
                setState(() {
                  int difference = newQuantity - 1;
                  product.quantity =
                      (int.parse(product.quantity) - difference).toString();
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
