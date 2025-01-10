import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/Services/api/auth.dart';
import 'package:untitled/models/user/usermodel.dart';
import 'Cubit/States.dart';
import 'Cubit/cubit.dart';
class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  bool loading=false;
  late User? user;
  File imageProfile=File('');
  @override
  void initState() {
    super.initState();
    getProfile();
  }
  getProfile()async{
    setState(() {
      loading=true;
    });
    var data=await profile_endpoint();
    setState(() {
      loading=false;
      user=data;
    });
  }
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageProfile = File(pickedFile.path);
      });

    }
  }

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
              body: loading==true?
                  Center(child: CircularProgressIndicator(),)
                  :Center(
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
                                backgroundImage: user!.profilePicture==null? imageProfile.path.isEmpty?AssetImage('assets/images/pppp.jpg'):FileImage(imageProfile):NetworkImage(user!.profilePicture),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 3,
                                  end: 3,
                                ),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(icon: Icon(Icons.camera_alt_outlined),onPressed:()=>pickImage(ImageSource.gallery)),
                                ),

                              ),


                            ],
                          ),
                        ),
                        TextField(
                          decoration:  InputDecoration(
                            hintText: user?.firstName,
                            labelText: user?.firstName,
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (value) {

                            cubit.updateFirstName(value);
                          },

                        ),
                        TextField(
                          decoration:  InputDecoration(
                            hintText: user?.lastName,
                            labelText: user?.lastName,
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (value) {
                            cubit.updateSecoundName(value);
                          },
                        ),
                        TextField(
                          decoration:  InputDecoration(
                            hintText: user?.location,
                            labelText: user?.location??'Location',
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
                              onPressed: ()async{
                                await Upload_imagprofile(imageProfile);
                                getProfile();
                              },
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
