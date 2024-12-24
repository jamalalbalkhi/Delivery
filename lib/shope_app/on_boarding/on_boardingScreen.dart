import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Logindelivery/login.dart';
import '../../Styles/Colors.dart';
class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({

    required this.image,
    required this.title,
    required this.body,
  });
}


class OnBoardingscreen extends StatefulWidget {
  @override
  State<OnBoardingscreen> createState() => _OnBoardingscreenState();
}

class _OnBoardingscreenState extends State<OnBoardingscreen> {
  var boardController = PageController();

  List<BoardingModel>boarding=[
    BoardingModel(
        image: 'assets/images/motor.jpg',
        title: 'Welcome to Delivery app',
        body: '24/7 Customer Service to Assist You'),
    BoardingModel(
        image: 'assets/images/car.jpg',
        title: 'Fast Delivery',
        body: 'Fast and Reliable Delivery Service'),
    BoardingModel(
        image: 'assets/images/man.jpg',
        title: 'Good Service',
        body: 'Satisfaction Guaranteed or Your Money Back'),
  ];

  bool islast = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: ()
          {


          },
              child: Text('Skip'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index)
                {
                  if (index==boarding.length-1)

                {
                setState(() {
                islast =true;

                });
                }
                      else {
                        setState(() {
                          islast = false;
                                 });
                  }

                    }
                ,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(controller: boardController,
                    effect:ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defultColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                    ) ,
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if (islast) {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(
                              builder: (context) => Loginscreen()),
                              (route) {
                            return false;
                          }
                      );
                    }
                    else {
                      boardController.nextPage
                        (
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.bounceInOut
                      );
                    }


                   },
                  child: Icon(Icons.arrow_forward_ios),),
              ],
            ),

          ],
        ),
      )
    );


  }

  Widget buildBoardingItem(BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Image
            (image: AssetImage('${model.image}'),
            fit: BoxFit.cover,
          )
      ),
      SizedBox(
        height: 10,
      ),
      Text('${model.title}',style:
      TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
      ),
      SizedBox(
        height: 10,
      ),
      Text('${model.body}',style:
      TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold
      ),

      ),
      SizedBox(
        height: 10,
      ),

    ],
  );
}
