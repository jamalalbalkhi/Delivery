import 'package:flutter/material.dart';
import 'package:untitled/models/products.dart';

import '../Services/api/auth.dart';

import '../productdiscreption/productdiscreption.dart';


class itemsScreen extends StatefulWidget {
  final String storename;
  List<product> pro;
  int id;
  itemsScreen({
    required this.id,
    required this.pro,
    required this.storename
  });

  @override
  State<itemsScreen> createState() => _itemsScreenState();
}

class _itemsScreenState extends State<itemsScreen> {
  var loading = false;
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

    var data = await Prodauct_endPoint(widget.id);
    setState(() {
      widget.pro=data;
      loading=false;
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.storename
        ),
      ),
      body:loading==true?const Center(
        child: CircularProgressIndicator(),
      ):
      ListView.separated(
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),


        itemCount: widget.pro.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(20.0),

            child: ListTile(
              title:Row(
                children: [
                  Expanded(
                    child: Text(

                      widget.pro[index].name??"",
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
                        await addToFavorite(widget.pro[index].id!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Product added to the Favorite'),
                          ),
                        );
                      },
                      icon: CircleAvatar(
                        radius: 20,

                        child: Icon(
                        Icons.favorite_border,
                        size: 22,),
                      )
                  ) ],

              ),


              leading:CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.pro[index].photo??""),
              ),
                onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => discribthionScreen(
                    p:widget.pro[index] ,

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