import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/Cubit/cubit.dart';
import 'package:untitled/modules/counter/Cubit/states.dart';

class CounterScreen extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return BlocProvider (
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state) { },
        builder: (context,state)
        {
          return   Scaffold(
          appBar: AppBar(
          title: Text('Counter'),
          ),
          body: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
          TextButton(onPressed: ()
          {
            CounterCubit.get(context).minus();
          },
            child: Text('Minus',style: TextStyle(
          fontSize: 20,


          ),),),
          Text('${CounterCubit.get(context).counter}',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          ),),
          TextButton(onPressed: (){
            CounterCubit.get(context).plus();
          }, child: Text('Plus',style: TextStyle(
          fontSize: 20,

          ),),),
          ],
          ),
          ),

          );
        } ,

      ),
    );
  }
}

