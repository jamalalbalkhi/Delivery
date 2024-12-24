import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/News_App/Cubit/States.dart';
import '../../layout/News_App/Cubit/cubit.dart';
import '../../shared/components/components.dart';


class businessscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit,newsStates>(
      listener: (context,state){},
      builder:(context,state){
        return  ConditionalBuilder(
          condition:state is!newsgetbusinesslodingstate ,
          builder:(context)=>
              ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index)=>buildArticlesItem(context) ,
                itemCount:10 ,
                separatorBuilder:(context,index)=>myDivider() ,
              ) ,
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,

        );
      } ,
    );
  }
}
