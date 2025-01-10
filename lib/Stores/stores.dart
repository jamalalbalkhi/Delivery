import 'package:flutter/material.dart';
import '../Services/api/auth.dart';
import '../categories/categoriesScreen.dart';
import '../models/Marketmodel.dart';
import '../product/product.dart';
class storesScreen extends StatefulWidget {
  final String categoryname;
  List<Market> stor;
  final int id;
  storesScreen({
    required this.stor,
    required this.id,
    required this.categoryname
  });

  @override
  State<storesScreen> createState() => _storesScreenState();
}
class _storesScreenState extends State<storesScreen> {
  bool loading=false;
  @override
  void initState() {
    super.initState();
    getmarket();
  }
     getmarket()
     async{
        setState(() {
          loading=true;
        });
        var data = await Markets_endPoint(widget.id);
        print(data);
        setState(() {
          widget.stor=data;
          loading=false;
        });
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.categoryname
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


        itemCount: widget.stor.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              title:Text(
                widget.stor[index].name??"",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ) ,
              leading:CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.stor[index].photo??""),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => itemsScreen(
                          pro: [],
                          storename: widget.stor[index].name??"", id: widget.stor[index].id??0,)
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