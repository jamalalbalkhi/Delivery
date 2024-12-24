import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/user/usermodel.dart';

import 'Cubit/States.dart';
import 'Cubit/cubit.dart';

class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context) =>profilecubit(),
      child: BlocConsumer<profilecubit,ProfileState>(
          listener:( context,  state) {  },

          builder: (BuildContext context, ProfileState state)
          {
            var cubit=profilecubit().get(context);
            return   Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Center(
                          child: Stack(
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
                                    cubit.updateImageUrl('assets/images/gg.jpg');


                                  } ,),
                                ),

                              ),


                            ],
                          ),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (value) {
                            cubit.updateFirstName(value);
                          },

                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (value) {
                            cubit.updateSecoundName(value);
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Location',
                            prefixIcon: Icon(Icons.location_on_sharp),

                          ),
                          onChanged: (value) {
                            cubit.updateLocation(value);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,

                                borderRadius:BorderRadius.circular(10)



                            ),

                            child: MaterialButton(
                              onPressed: (){},
                              child: const Text(
                                'Save',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            );




          }

      ),
    );

  }
}
