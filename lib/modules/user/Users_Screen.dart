import 'package:flutter/material.dart';

import '../../models/user/usermodel.dart';



class UsersScreen extends StatelessWidget {
  List<UserModel> object =[
    UserModel(
      Id :1,
      name: 'ahmad',
      phone: '098765434',
    ),
    UserModel(
      Id :2,
      name: 'Ali',
      phone: '098754684',
    ),
    UserModel(
      Id :3,
      name: 'jamal',
      phone: '0987645434',
    ),
    UserModel(
      Id :1,
      name: 'ahmad',
      phone: '098765434',
    ),
    UserModel(
      Id :2,
      name: 'Ali',
      phone: '098754684',
    ),
    UserModel(
      Id :3,
      name: 'jamal',
      phone: '0987645434',
    ),
    UserModel(
      Id :1,
      name: 'ahmad',
      phone: '098765434',
    ),
    UserModel(
      Id :2,
      name: 'Ali',
      phone: '098754684',
    ),
    UserModel(
      Id :3,
      name: 'jamal',
      phone: '0987645434',
    ),
    UserModel(
      Id :1,
      name: 'ahmad',
      phone: '098765434',
    ),
    UserModel(
      Id :2,
      name: 'Ali',
      phone: '098754684',
    ),
    UserModel(
      Id :3,
      name: 'jamal',
      phone: '0987645434',
    ),
    UserModel(
      Id :1,
      name: 'ahmad',
      phone: '098765434',
    ),
    UserModel(
      Id :2,
      name: 'Ali',
      phone: '098754684',
    ),
    UserModel(
      Id :3,
      name: 'jamal',
      phone: '0987645434',
    ),
    UserModel(
      Id :1,
      name: 'ahmad',
      phone: '098765434',
    ),
    UserModel(
      Id :2,
      name: 'Ali',
      phone: '098754684',
    ),
    UserModel(
      Id :3,
      name: 'jamal',
      phone: '0987645434',
    ),
  ];
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.blue[200],
    title: Text('Users',style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),),

  ),
  body: ListView.separated(
      itemBuilder: (context,index)=>buildUsers(object[index]),
      separatorBuilder: (context,index)=>Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
        ),
        child: Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
      ),
      itemCount: object.length,
  )


);
  }




  Widget buildUsers (UserModel mhd)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(

          backgroundColor: Colors.grey,
          radius: 30,
          child: Text('${mhd.Id}',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:30,
          ),),

        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text('${mhd.name}',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Text('${mhd.phone}',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),),
          ],
        )
      ],
    ),
  );



}  

