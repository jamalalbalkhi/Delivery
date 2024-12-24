import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal
        ,
        leading: Icon(
          Icons.menu
              ,color: Colors.black,
        ),actions: [
          IconButton(icon: Icon(
      Icons.notification_important
        ,color: Colors.black,),
            onPressed: (){},

          ),
        IconButton(icon: Icon(Icons.search
            , color: Colors.black

        ),
        onPressed: (){},)



      ],
        title: Text('Whtsapp'),
        centerTitle:true,


      ),
      body: Column(
        children: [
          Text('ADSFGHJIKLSADFG',
            style:TextStyle(color:Colors.black,fontSize: 30.0
                ,/*backgroundColor:Colors.red*/),
          ),
          Text('rft',)
        ]
        ,)

    );

  }

}
