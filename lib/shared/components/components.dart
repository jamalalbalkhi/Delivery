import 'package:flutter/material.dart';

Widget defultButton({
  double width=double.infinity,
  Color background=Colors.blue,
  bool isUppercase=true,
  double radius=10,
  required Function() function,
  required String text,
})=>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(isUppercase?text.toUpperCase():text,style: TextStyle(
          color: Colors.white,
        ),),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:background ,

      ),
    );
Widget defultformfaild({
  required TextEditingController controller,
  required TextInputType type,
  required String lable,
  required IconData prefix,
  bool ispassword=false,
  required String? Function(String?)? validate,
  Function(String)? onsubmited,
  Function(String)? onchanged,
  Function()? suffixPressed,
  IconData? suffix,



})
=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: ispassword,
  onFieldSubmitted: onsubmited,
  onChanged: onchanged ,

  validator: validate,
  decoration: InputDecoration(
    labelText: lable,
    prefixIcon: Icon(
      prefix ,
    ),
    suffixIcon:suffix!=null?
    IconButton(
      onPressed:suffixPressed ,
      icon: Icon(
        suffix ,
      ),
    ):null,



    border: OutlineInputBorder(),


  ),
);
Widget buildArticlesItem(context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:DecorationImage(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx1g69aT9c4tRWR96oetyodK9wg_1akwRrPg&s'),
              fit: BoxFit.cover,
            )
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Title',
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,


                ),
              ),
              Text(
                '2021-04-02T11:43:00Z',
                style: TextStyle(
                    color:Colors.grey
                ),
              )
            ],
          ),
        ),
      )
    ],
  ),
);
Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);



