import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/States.dart';
import 'Cubit/States.dart';
import 'Cubit/States.dart';
import 'Cubit/States.dart';
import 'Cubit/cubit.dart';

class newslayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>newscubit()..getbusiness(),
      child: BlocConsumer<newscubit,newsStates>(
        listener: (context,state){},
        builder: ( context,  state){
          var cubit= newscubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News app'
              ),
              actions: [
                IconButton(
                    onPressed:(){


                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed:(){
                      newscubit.get(context).changeappmode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),

              ],

            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items:cubit.bottomItems ,
              onTap:(index){
                cubit.change(index);

              } ,
            ),
          );
        },
      ),
    );
  }
}
