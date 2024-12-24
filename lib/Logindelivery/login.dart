import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Services/api/auth.dart';
import '../../shared/components/components.dart';
import '../Delivery/delivery.dart';
import '../RegisterDelivery/register.dart';
import 'cubit/StatesScreen.dart';
import 'cubit/cubitScreen.dart';
 class Loginscreen extends StatelessWidget {
  var phonecontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>logincubit(),
      child: BlocConsumer<logincubit,loginstates>(
        listener: (BuildContext context, loginstates state) {  },
        builder: (BuildContext context, loginstates state) {
          var cubit =logincubit.get(context);
          return          Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key:formkey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset('assets/images/image2.jpg'),
                        SizedBox(
                          height: 20,
                        ),

                        defultformfaild(
                            onsubmited: (value){
                              print(value);
                            },
                            controller: phonecontroller,
                            lable: 'phone',
                            prefix: Icons.phone,
                            type: TextInputType.phone,
                            validate: ( value){
                              if(value!.isEmpty){
                                return'Phone Must not be Empty';
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defultformfaild(
                            controller: passwordcontroller,
                            lable: 'Password',
                            prefix: Icons.lock,
                            suffix: cubit.isPassword?Icons.visibility:Icons.visibility_off,
                            ispassword: cubit.isPassword,
                            type: TextInputType.visiblePassword,
                            suffixPressed: (){
                              cubit.changePasswordVisibility();
                            },
                            validate: ( value){
                              if(value!.isEmpty){
                                return'Password Must not be Empty';
                              }
                              return null;
                            }

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defultButton(
                          text: 'login',
                          function:() async{
                            if(formkey.currentState!.validate()) {
                             var data= await login_endPoint(phonecontroller.text, passwordcontroller.text);
                             if(data!=null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DeliveryScreens()));
                              }
                            }
                            else{
                              print(phonecontroller.text);
                              print(passwordcontroller.text);
                            }



                          },
                          background: Colors.orange,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have account?',),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>RigesterScreen(),
                                    ),
                                  );
                                },
                                child: Text('Register Now'))
                          ],
                        ),




                      ],
                    ),
                  ),
                ),
              ),
            ),

          );

        },
      ),
    );
  }
}