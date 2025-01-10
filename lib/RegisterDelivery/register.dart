import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Services/api/auth.dart';
import '../Delivery/delivery.dart'
;import '../../shared/components/components.dart';
import 'cubit/States.dart';
import 'cubit/cubit.dart';
class RigesterScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RigesterCubit(),
      child: BlocConsumer<RigesterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          var cubit = RigesterCubit().get(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Rigester',
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  AssetImage('assets/images/pppp.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'First Name',
                          ),
                          onChanged: (value) {
                            cubit.updateFirstName(value);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "This Field is requried";
                            }
                            return null;
                          },
                          controller: cubit.FirstNameController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Location',
                          ),
                          onChanged: (value) {
                            cubit.updateLocation(value);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "This Field is requried";
                            }
                            return null;
                          },
                          controller: cubit.LocationController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                          ),
                          onChanged: (value) {
                            cubit.updateSecoundName(value);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "This Field is requried";
                            }
                            return null;
                          },
                          controller: cubit.LastNameController,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone',
                          ),
                          onChanged: (value) {
                            cubit.updatephone(value);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "This Field is requried";
                            }
                            return null;
                          },
                          controller: cubit.PhoneController,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          onChanged: (value) {
                            cubit.updatepassword(value);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "This Field is requried";
                            }
                            return null;
                          },
                          controller: cubit.PasswordController,
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
                          child: MaterialButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                var data = await Register_endPoint(
                                   Firstname: cubit.FirstNameController.text,
                                   location: cubit.LocationController.text,
                                   Lastname: cubit.LastNameController.text,
                                   phone: cubit.PhoneController.text,
                                   password: cubit.PasswordController.text);
                                if (data != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DeliveryScreens()));
                                }
                              }
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]),
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
