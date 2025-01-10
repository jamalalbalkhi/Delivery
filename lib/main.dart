import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/modules/massenger/MessengerScreen.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shope_app/on_boarding/on_boardingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/translate/translatecontroller.dart';
import 'Delivery/delivery.dart';
import 'Logindelivery/login.dart';
import 'Services/api/auth.dart';
import 'Translate/translate.dart';
import 'categories/categoriesScreen.dart';
import 'layout/News_App/Cubit/States.dart';
import 'layout/News_App/Cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/home/home_screen.dart';

void main(){
  //WidgetsFlutterBinding.ensureInitialized();
  //var sharepref=await SharedPreferences.getInstance();
  diohelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Mytranslatecontroller controller = Get.put(Mytranslatecontroller());
    return BlocProvider(
      create: (BuildContext context) => newscubit(),
      child: BlocConsumer<newscubit,newsStates>(
        listener:(context,state){} ,
        builder: (context,state){
          return GetMaterialApp(
            locale: Locale("en"),

               translations: MyTranslate(),
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