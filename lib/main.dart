import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/modules/massenger/MessengerScreen.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shope_app/on_boarding/on_boardingScreen.dart';

import 'Logindelivery/login.dart';
import 'layout/News_App/Cubit/States.dart';
import 'layout/News_App/Cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';

void main(){
  diohelper.init();
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>newscubit(),
      child: BlocConsumer<newscubit,newsStates>(
        listener:(context,state){} ,
        builder: (context,state){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                      backgroundColor: Colors.orange

                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.orange,
                      elevation: 20
                  )
              ),

              home:OnBoardingscreen()






          );
        },


      ),
    );


  }
}