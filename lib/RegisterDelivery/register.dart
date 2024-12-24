import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Services/api/auth.dart';

import '../../shared/components/components.dart';
import '../Delivery/delivery.dart';
import 'cubit/States.dart';
import 'cubit/cubit.dart';
class RigesterScreen extends StatelessWidget {
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RigesterCubit(),
      child: BlocConsumer<RigesterCubit,RegisterState>(
        listener: ( context,  state) {  },
        builder: (BuildContext context, state) {
          var cubit=RigesterCubit().get(context);
          return   Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Rigester',
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 100,
                                    backgroundImage: AssetImage('assets/images/pppp.jpg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom: 3,
                                      end: 3,
                                    ),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: IconButton(icon: Icon(Icons.camera_alt_outlined),onPressed:(){
                                        cubit.updateImageUrl('assets/images/rrrr.jpg');


                                      } ,),
                                    ),

                                  ),


                                ],
                              ),


                              TextField(
                                decoration:  InputDecoration(
                                  labelText: 'First Name',
                                ),
                                onChanged: (value) {
                                  cubit.updateSecoundName(value);
                                },
                              ),

                              TextField(
                                decoration:  InputDecoration(
                                  labelText: 'Last Name',
                                ),
                                onChanged: (value) {
                                  cubit.updateSecoundName(value);
                                },
                              ),
                              TextField(
                                decoration:  InputDecoration(labelText: 'Location'),
                                onChanged: (value) {
                                  cubit.updateLocation(value);
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration:  InputDecoration(
                                  labelText: 'Phone',
                                ),
                                onChanged: (value) {
                                  cubit.updatephone(value);
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration:  InputDecoration(
                                  labelText: 'Password',
                                ),
                                onChanged: (value) {
                                  cubit.updatepassword(value);
                                },
                              ),



                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orangeAccent,
                                ),
                                child: MaterialButton(onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DeliveryScreens()));

                                  }





        ,
                                  child:  Text(
                                    'Singup',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),




                              ),
                                ),
                              ),

                            ]

                        ),

                      )
                  )
              )
          );


        },
      ),
    );
  }
}