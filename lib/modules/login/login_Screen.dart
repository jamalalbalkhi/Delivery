import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class Loginscreenn extends StatefulWidget {
  @override
  State<Loginscreenn> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreenn> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool isbassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                  defultformfaild(
                    onchanged: (
                        value
                        ){
                      print(value);
                    },

                      controller: emailcontroller,
                      lable: 'Email',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  defultformfaild(
                      controller: passwordcontroller,
                      lable: 'Password',
                      prefix: Icons.lock,
                      suffix:
                      isbassword ? Icons.visibility : Icons.visibility_off,
                      ispassword: isbassword,
                      type: TextInputType.visiblePassword,
                      suffixPressed: () {
                        setState(() {
                          isbassword = !isbassword;
                        });
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defultButton(
                      text: 'login',
                      function: () {
                        if (formkey.currentState!.validate()) {
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defultButton(
                      text: 'ReGIster',
                      function: () {
                        print(emailcontroller.text);
                        print(passwordcontroller.text);
                      },
                      isUppercase: false,
                      background: Colors.red),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account?',
                      ),
                      TextButton(onPressed: () {}, child: Text('Register Now'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
