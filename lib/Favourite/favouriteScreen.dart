import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/products.dart';

import '../Services/api/auth.dart';
import '../productdiscreption/productdiscreption.dart';

class Favouritescreen extends StatefulWidget {

  @override
  State<Favouritescreen> createState() => _FavouritescreenState();
}

class _FavouritescreenState extends State<Favouritescreen> {
  var loading = false;
  var isEmpty=false;
  List<product> products=[];
  @override
  void initState() {
    super.initState();
    getProduct();

  }
  getProduct()async
  {
    setState(() {
      loading=true;

    });

    var data = await getFavoriteList();
    setState(() {
      if(data!=null) {
        products = data;
        loading = false;
      }
      else{
        isEmpty=true;
        loading=false;
      }
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:loading==true?const Center(
        child: CircularProgressIndicator(),
      ):isEmpty==true?
          Center(child: Text('1'.tr)):
      ListView.separated(
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),


        itemCount: products.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(20.0),

            child: ListTile(
              title:Row(
                children: [
                  Expanded(
                    child: Text(

                      products[index].name??"",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: ()
                      async{
                        await removeFromFavorite(products[index].id!);
                        await getProduct();
                        print(" ");
                      },
                      icon: CircleAvatar(
                        radius: 20,

                        child: Icon(
                          Icons.delete,
                          size: 22,),
                      )
                  ),
                  IconButton(onPressed: () async{
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
                                        products[index].quantity++;
                                      });
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                  SizedBox(width: 10),
                                  Text("Quantity: ${products[index].quantity}"),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {
                                      if(products[index].quantity>0)
                                        setState(() {
                                          products[index].quantity--;
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
                                      if (int.parse(products[index].count.toString()) > 0) {
                                        //orders.add(p);
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('No more ${products[index].name} in stock!'),
                                          ),
                                        );
                                      }
                                    });
                                    await createOrder([products[index]]);
                                    products[index].quantity=0;
                                    Get.close(0);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('${products[index].name} has been Orderd'),
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
                    // if (int.parse(products[index].) > 0) {
                    //   orders.add(p);
                    //   products[index].quantity = (int.parse(products[index].quantity) - 1).toString();
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('${products[index].name} has been ordered!')),
                    //   );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Out of stock!')),
                    //   );
                    // }
                  }, icon: Icon(Icons.add_card))
                ],

              ),


              leading:CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(products[index].photo??""),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => discribthionScreen(
                    p:products[index] ,

                  )),
                );

              },
            ),
          );
        },
      ),
    );}
}