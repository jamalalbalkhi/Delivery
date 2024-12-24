 import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Science/Science_screen.dart';
import 'package:untitled/modules/Sport/sport_screen.dart';
import '../../../modules/business/business_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'States.dart';


class newscubit extends Cubit<newsStates>{
  bool isdark = true;
  ThemeMode appmode=ThemeMode.dark;
  void changeappmode()
  {
    isdark=!isdark;
    emit(appchangemoodstate());

  }

  newscubit(): super(newsinitialstate());



  static newscubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
      icon:Icon (Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon (Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon:Icon (Icons.science),
      label: 'Science',
    ),

  ];
  List<Widget>screens=[
    businessscreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  void change(int index){
    currentIndex=index;

    emit(newsbottomnavstate());

  }
  List<dynamic> business=[];
  void getbusiness(){
    emit(newsgetbusinesslodingstate());
    diohelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'business',
          'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      print(business[0]['title']);
      emit(newsgetbusinessSuccessstate());

    }).catchError((error) {
      print(error.toString());
      emit(newsgetbusinessErrorstate(error.toString()));

    } );


  }
  List<dynamic> sports=[];
  void getsports(){
    emit(newsgetsportslodingstate());
    diohelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      sports=value.data['articles'];
      print(business[0]['title']);
      emit(newsgetsportsSuccessstate());

    }).catchError((error) {
      print(error.toString());
      emit(newsgetsportsErrorstate(error.toString()));

    } );


  }
  List<dynamic> science=[];
  void getbuscience(){
    emit(newsgetsciencelodingstate());
    diohelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      science=value.data['articles'];
      print(business[0]['title']);
      emit(newsgetscienceSuccessstate());

    }).catchError((error) {
      print(error.toString());
      emit(newsgetscienceErrorstate(error.toString()));

    } );



  }


}