import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user/usermodel.dart';
import 'Cubit/States.dart';
import 'Cubit/cubit.dart';


class DeliveryScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>DeliveryApp(),
      child: BlocConsumer<DeliveryApp,DeliveryStates>(
        listener: (BuildContext context,  state) {  },
        builder: (BuildContext context,  state) {
          var cubit =DeliveryApp.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text(
                  cubit.titles[cubit.currentIndex]
              ),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded))
              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.currentIndex ,
              onTap: (index){
                cubit.changeNavBar(index);
              },
              items:cubit.bottomItems,
            ),
          );

        },
      ),
    );
  }
}