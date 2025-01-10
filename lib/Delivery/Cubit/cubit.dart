import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:untitled/models/user/usermodel.dart';

import '../../Basket/BasketScreen.dart';
import '../../Favourite/favouriteScreen.dart';
import '../../ProfileScreen/profile.dart';
import '../../Request/requestScreen.dart';
import '../../categories/categoriesScreen.dart';
import 'States.dart';


class DeliveryApp extends Cubit<DeliveryStates>{

  DeliveryApp():super(DeliveryInitialStates());
  static DeliveryApp get(context)=>BlocProvider.of(context);
  List<String> titles=[
    'Categories'.tr,
    'profile',
    'Basket',
    'Favorite',
    'Requests'
  ];

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
      icon:Icon(Icons.cabin),
      label: 'Categories',),
    BottomNavigationBarItem(
      icon:Icon(Icons.person),
      label: 'profile',),
    BottomNavigationBarItem(
      icon:Icon(Icons.shopping_basket_sharp),
      label: "basket".tr,),
    BottomNavigationBarItem(
      icon:Icon(Icons.favorite_sharp,),
      label: 'Favorite',),
    BottomNavigationBarItem(
      icon:Icon(Icons.request_page),
      label: 'Requests',),


  ];
  List<Widget> screen=[
    categoriesScreen(),
    ProfileScreen(),
    Basketscreen(),
    Favouritescreen(),
    Requestscreen(),
  ];
  void changeNavBar(int index){
    currentIndex=index;
    emit(DeliveryBottomNavStates());
  }
}