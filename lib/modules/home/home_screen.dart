import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/translate/translatecontroller.dart';
class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Mytranslatecontroller controllerlang=Get.find() ;

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
        title: Text("1".tr),
        centerTitle:true,


      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              color: Colors.red,
                textColor: Colors.white,
                onPressed: (){
                controllerlang.changeLang("en");
                },
               child: Text("2".tr),
    ),
          ),
          Center(
            child: MaterialButton(
                child: Text("3".tr),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: (){
                  controllerlang.changeLang("en");

                }),
          ),

        ]
        ,)

    );

  }

}
