import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messengerscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(

            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.DqTYGtzChDSOuxmCD8o9XgAAAA?rs=1&pid=ImgDetMain'),
              ),
              SizedBox(
                width: 15,
              ),

              Text('hazem', style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),


            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 15,
              child: Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,

              ),

            ),),
            IconButton(onPressed: () {}, icon: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 15,
              child: Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,

              ),

            ),)

          ],


        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
            
                    borderRadius: BorderRadius.circular(5),
                  ),
            
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 15
                        ,
                      ),
                      Text('search', style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),),
            
                    ],
                  ),
            
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 110,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder:(context,item)=>SizedBox(
                      width: 20,
                    ),
                    scrollDirection:Axis.horizontal,
                    itemBuilder: (context,item)=>buildStoryItem(),
                    itemCount: 10,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemBuilder:(context,index)=> buildChildItem(),
                    separatorBuilder:(context,index) =>
                        SizedBox(
                      height: 10,)
                  ,
                    itemCount: 50,
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget buildChildItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(

                radius: 30,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.rnbgyqF3W7iqsMiH-yBM0gHaJd?w=500&h=639&rs=1&pid=ImgDetMain'),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,

              ),
              CircleAvatar(
                radius: 9,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crestiano Ronaldo',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,

                  ),),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello my name is Ronaldo',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Text('2:00 pm'),

                  ],
                )
              ],
            ),
          )


        ],
      );
  Widget buildStoryItem() =>Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.8ZXtcCEevJOkkNKKm0F62gAAAA?rs=1&pid=ImgDetMain'),

            ),
            CircleAvatar(


              radius: 10,
              backgroundColor: Colors.white,

            ),
            CircleAvatar(


              radius: 9,
              backgroundColor: Colors.green,

            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),

        Text('Messi', maxLines: 2,

          overflow: TextOverflow.ellipsis,),

      ],
    ),
  );
}