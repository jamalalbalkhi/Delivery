import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:untitled/Logindelivery/login.dart';
import 'package:untitled/Services/api/auth.dart';
import '../categories/categoriesScreen.dart';
import '../models/products.dart';
import '../models/user/usermodel.dart';
import '../productdiscreption/productdiscreption.dart';
import 'Cubit/States.dart';
import 'Cubit/cubit.dart';
class DeliveryScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>DeliveryApp(),
      child: BlocConsumer<DeliveryApp,DeliveryStates>(
        listener: (BuildContext context,  state) {  },
        builder: (BuildContext context,  state) {
          var cubit =DeliveryApp.get(context);
          return  Scaffold(
            appBar: AppBar(

              leading:

              IconButton(onPressed: ()async{
               var data= await Logout_endpoint();
               if (data==true)
                 {
                   Navigator.pushAndRemoveUntil(context,
                       MaterialPageRoute(builder: (context)=>Loginscreen())
                       ,(route) => false);
                 }
              }, icon: Icon(Icons.logout)),
              title: Text(
                  cubit.titles[cubit.currentIndex]
              ),
              actions: [

                IconButton(onPressed: ()
                {
                  showSearch(context: context, delegate: CustemSearch());
                },
                    icon: Icon(Icons.search_rounded)),
                SizedBox(width: 10,),
                IconButton(onPressed: ()async{
                  await showCupertinoDialog(context: context, builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context,StateSetter setState) =>  CupertinoAlertDialog(
                          title:Text( "change language".tr),
                          actions:[
                            TextButton(onPressed: (){
                              var locale = Locale('ar',);
                              print(locale.languageCode);
                              Get.updateLocale(locale);
                            Get.back();
                            }, child: Text("Arabic".tr,style: TextStyle(color: Theme.of(context).primaryColor),),),
                            SizedBox(width: 10,),
                            TextButton(onPressed: (){
                              var locale = Locale('en');
                            print(locale.languageCode);
                            Get.updateLocale(locale);
                            Get.back();
                            }, child: Text("English".tr,style: TextStyle(color: Theme.of(context).primaryColor),),),
                          ],
                        ),
                    );
                  }
                  );

                }, icon: Icon(Icons.translate))

              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.currentIndex ,
              onTap: (index){
                cubit.changeNavBar(index);
              },
              items:cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
class CustemSearch extends SearchDelegate
{
  List<product> categorie = [
    // categories(
    //   name: ' Fast Food',
    //   image: 'assets/images/fastfood.jpg',
    //   store:
    //   [
    //     stores(
    //       name: 'King Over',
    //       image: 'assets/images/king.jpg',
    //       prod: [
    //         products ( name: 'Original Wings',
    //             image: 'assets/images/wings.webp',
    //             describthion: 'Wings with original and hot sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //
    //         products(name: 'Classic Burger',
    //             image: 'assets/images/classic burger.jpg',
    //             describthion: 'Steak, cheese, tomato, onion, pickle with special sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products ( name: 'Chicken fries',
    //             image: 'assets/images/chikenfrise.jpg',
    //             describthion: 'Potatoes, chicken breast, jalapeno and sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products ( name: 'Chili Cheese Nuggets',
    //             image: 'assets/images/chili-and-cheese-nuggets.webp',
    //             describthion: 'Potatoes, cheddar cheese and chicken',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products ( name: 'Cheese Burger',
    //             image: 'assets/images/chesse burger.jpg',
    //             describthion: 'Steak,  double cheese, tomato, onion, pickle with special sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //       ],
    //
    //
    //     ),
    //     stores(
    //         name: 'Action Pizza',
    //         image: 'assets/images/pizza.jpg',
    //         prod: [
    //           products(name: 'Four Seasons Pizza',
    //               image: 'assets/images/four.jpg',
    //               describthion: 'eat apple',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'Vegetable pizza',
    //               image: 'assets/images/vegetabels.jpg',
    //               describthion: 'Pizza with different types of vegetables',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'Margherita Pizza',
    //               image: 'assets/images/margareta.jpg',
    //               describthion: 'Pizza with lots of cheese',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'Chicken pizza',
    //               image: 'assets/images/chikenpizza.jpg',
    //               describthion: 'Pizza with chicken cubes and sauce',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'Pepperoni pizza',
    //               image: 'assets/images/pepperoni.jpg',
    //               describthion: 'Pizza with pepperoni and cheese',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //         ]
    //
    //     ),
    //     stores(
    //         name: 'Bufflay Burger',
    //         image: 'assets/images/baffly.jpg',
    //         prod: [
    //           products(name: 'onion rings',
    //               image: 'assets/images/onion.jpg',
    //               describthion: 'Onions fried in oil',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'Flat Burger',
    //               image: 'assets/images/flat.jpg',
    //               describthion: 'Toasted bun, Angus beef, lettuce, pickles, Swiss cheese, crispy onions, special truffle sauce.',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'Mushroom Burger',
    //               image: 'assets/images/mushroom.jpg',
    //               describthion: 'Chicken or beef slice with mushrooms, onions and special mushroom sauce',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'Buffalo Boneless',
    //               image: 'assets/images/bufflalo.jpg',
    //               describthion: 'boneless meat with sauce',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //           products(name: 'king Starter',
    //               image: 'assets/images/king.jpg',
    //               describthion: 'Fried chicken, cheese balls, French fries and different sauces',
    //               price: 1000,
    //               quantity: '2 kilo'),
    //         ]
    //
    //     ),
    //     stores(
    //       name: 'Crispy Way',
    //       image: 'assets/images/crispy.jpg',
    //       prod: [
    //         products(name: 'BBQ Crispy Burger',
    //             image: 'assets/images/BBq.jpg',
    //             describthion: 'eat banana',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'Special Burger',
    //             image: 'assets/images/special.jpg',
    //             describthion: 'Burger with sweet and spicy sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'Mozzarella fingers',
    //             image: 'assets/images/Mozzarella fingers.jpg',
    //             describthion: 'fried mozzarella cheese',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'fried chicken',
    //             image: 'assets/images/fride.jpg',
    //             describthion: 'Fried chicken with different sauces',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'Pasta salad',
    //             image: 'assets/images/pasted.jpg ',
    //             describthion: 'Pasta with mortadella, corn, cheese and sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //
    //       ],
    //
    //     ),
    //     stores(
    //       name: 'Beit Al Mukhtar Restaurant',
    //       image: 'assets/images/beit almokhtar.jpg',
    //       prod: [
    //         products(name: 'BBQ Chicken Sandwich',
    //             image: 'assets/images/Chicken Stuffed.jpg',
    //             describthion: 'Chicken Stuffed Bread with BBQ Sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'Crispy Sandwich',
    //             image: 'assets/images/Crispy chicken.jpg',
    //             describthion: 'Crispy chicken with mortadella slices, lettuce and sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'Special sandwich',
    //             image: 'assets/images/Delicious sandwich.jpg',
    //             describthion: 'Delicious sandwich with special ingredients',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'Spicy Fillet',
    //             image: 'assets/images/spicy fillet.jpg',
    //             describthion: 'Fried fish fillet with hot sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //         products(name: 'Turkish sandwich',
    //             image: 'assets/images/Grilled chicken.jpg ',
    //             describthion: 'Grilled chicken with vegetables and sauce',
    //             price: 1000,
    //             quantity: '2 kilo'),
    //
    //       ],
    //
    //     ),
    //
    //
    //   ],
    //
    // ),
    // categories(
    //   name: 'Office Supplies',
    //   image: 'assets/images/مستلزمات مكتبية.jpg',
    //   store: [
    //     stores
    //       (
    //         name: 'Art Supplies',
    //         image: 'assets/images/فنية.jpg',
    //         prod: [
    //           products(name: 'Sketchbooks',
    //               image: 'assets/images/دفاتر رسم.jpg',
    //               describthion: 'Different types of notebooks to draw on',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Colors',
    //               image: 'assets/images/الوان.jpg',
    //               describthion: 'Different types used for coloring',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Charcoal pens',
    //               image: 'assets/images/فحم.jpg',
    //               describthion: 'Black charcoal pencils used for drawing',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'gloves for painting',
    //               image: 'assets/images/قفازات.jpg',
    //               describthion: 'Used to protect the hand while drawing.',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Drawing boards',
    //               image: 'assets/images/لوح.jpg',
    //               describthion: 'Used to draw paintings on it.',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'School Supplies ',
    //         image: 'assets/images/مدرسية.jpg',
    //         prod: [
    //           products(name: 'Bags',
    //               image: 'assets/images/حقاءب.jpg',
    //               describthion: 'Used to put things in it',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Notebooks',
    //               image: 'assets/images/دفاتر.jpg',
    //               describthion: 'used to write on',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Pens',
    //               image: 'assets/images/حبر.jpg',
    //               describthion: 'used to write in',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Highlighter pens',
    //               image: 'assets/images/هايلايتر.jpg',
    //               describthion: 'used to identify important',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Erasers',
    //               image: 'assets/images/محايات.jpg',
    //               describthion: 'Used to erase mistakes',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Types of books ',
    //         image: 'assets/images/روايات.jpg',
    //         prod: [
    //           products(name: 'Beautiful Things',
    //               image: 'assets/images/شياءجميله.jpg',
    //               describthion: 'A beautiful book for optimism',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Les Miserables',
    //               image: 'assets/images/البوءساء.jpg',
    //               describthion: 'A book that tells a sad story',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Ecstasy',
    //               image: 'assets/images/اكستاسي.jpg',
    //               describthion: 'Very nice and enjoyable book',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Physics of Happiness',
    //               image: 'assets/images/فيزياء.jpg',
    //               describthion: 'Very nice and enjoyable book',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Because you are God',
    //               image: 'assets/images/لانك الله.jpg',
    //               describthion: 'Great religious book',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //     stores
    //
    //       (
    //         name: 'Laptop Accessories',
    //         image: 'assets/images/لابتوب.jpg',
    //         prod: [
    //           products(name: 'computer mouse',
    //               image: 'assets/images/ماوس.jpeg',
    //               describthion: 'Used to move on the screen',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Mouse pad',
    //               image: 'assets/images/باد.jpg',
    //               describthion: 'Used to put the mouse on it',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Keyboard',
    //               image: 'assets/images/كيبورد.jpg',
    //               describthion: 'Very nice and enjoyable book',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Laptop Headphones',
    //               image: 'assets/images/سماعات.jpg',
    //               describthion: 'keyboard for typing',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Laptop table',
    //               image: 'assets/images/طاولة.jpg',
    //               describthion: 'To put the laptop on it',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //
    //
    //     stores
    //       (
    //         name: 'Types of lighting',
    //         image: 'assets/images/اضاءات.jpg',
    //         prod: [
    //           products(name: 'Office lighting',
    //               image: 'assets/images/مكتبية.jpg',
    //               describthion: 'A It is used for lighting and gives a beautiful view',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Long lighting',
    //               image: 'assets/images/طويلة.jpg',
    //               describthion: 'It is used for lighting and gives a beautiful view',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Wall lighting',
    //               image: 'assets/images/حاءط.jpg',
    //               describthion: 'It is used for lighting and gives a beautiful view',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'short lighting',
    //               image: 'assets/images/قصيرة.jpg',
    //               describthion: 'It is used for lighting and gives a beautiful view',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'ceiling lighting',
    //               image: 'assets/images/سقف.jpg',
    //               describthion: 'It is used for lighting and gives a beautiful view',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //
    //     )
    //
    //   ],
    //
    // ),
    //
    //
    // categories(
    //   name: 'Makeup',
    //   image: 'assets/images/makeub.jpg',
    //   store: [
    //     stores
    //       (
    //         name: 'Dior ',
    //         image: 'assets/images/dioor.jpg',
    //         prod: [
    //           products(name: 'lipstick',
    //               image: 'assets/images/lip.jpg',
    //               describthion: 'Highly pigmented lipstick for a bold look',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Foundation',
    //               image: 'assets/images/found.jpg',
    //               describthion: 'Lightweight foundation for a natural finish',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'EyeShadow',
    //               image: 'assets/images/color.jpg',
    //               describthion: 'Versatile eyeshadow palette with vibrant colors',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'perfume',
    //               image: 'assets/images/ddpp.webp',
    //               describthion: 'The smell of the perfume is beautiful',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Highlighter',
    //               image: 'assets/images/hilight.jpg',
    //               describthion: 'Gives beautiful shine',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Chanel ',
    //         image: 'assets/images/channel.jpg',
    //         prod: [
    //           products(name: 'lipstick',
    //               image: 'assets/images/lipch.jpg',
    //               describthion: 'Highly pigmented lipstick for a bold look',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Foundation',
    //               image: 'assets/images/hhhh.jpg',
    //               describthion: 'Lightweight foundation for a natural finish',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'perfume',
    //               image: 'assets/images/par.jpg',
    //               describthion: 'The smell of the perfume is beautiful',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'powder',
    //               image: 'assets/images/ccccc.jpg',
    //               describthion: 'The powder plant gives brightness to the face',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Eyebrow gel',
    //               image: 'assets/images/جل حواجب.jpg',
    //               describthion: 'Fills in gaps and fixes eyebrows',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'SHEGLAM  ',
    //         image: 'assets/images/she.jpg',
    //         prod: [
    //           products(name: 'Foundation',
    //               image: 'assets/images/shegfound.jpg',
    //               describthion: 'Lightweight foundation for a natural finish',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'lipstick',
    //               image: 'assets/images/eye.jpg',
    //               describthion: 'Highly pigmented lipstick for a bold look',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Toner',
    //               image: 'assets/images/red.jpg',
    //               describthion: 'Highly pigmented toner for a bold look',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Mascara',
    //               image: 'assets/images/mascsh.jpg',
    //               describthion: 'dark ',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Makeup fixer',
    //               image: 'assets/images/مثبت.webp',
    //               describthion: 'Moisturizes the face and fixes makeup',
    //               price: 1000,
    //               quantity: '200'),
    //
    //
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Benefit',
    //         image: 'assets/images/loo.jpg',
    //         prod: [
    //           products(name: 'Bene tint',
    //               image: 'assets/images/بينيفت تنت.jpeg',
    //               describthion: 'Gives a nice red color to the cheeks.',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Eyeliner',
    //               image: 'assets/images/بينيفت ايلاينر.webp',
    //               describthion: 'Dark and solid',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Blusher',
    //               image: 'assets/images/بينيفت بلشر.webp',
    //               describthion: 'Gives a nice orange color to the face.',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Mascara',
    //               image: 'assets/images/بينيفت ماسكارا.webp',
    //               describthion: 'Lengthens and thickens eyelashes ',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Makeup fixer',
    //               image: 'assets/images/مثبت مكياج بينيفت.jpg',
    //               describthion: 'Moisturizes the face and fixes makeup',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Maybelline',
    //         image: 'assets/images/ميبيلين.png',
    //         prod: [
    //           products(name: 'Concealer',
    //               image: 'assets/images/كونسيلر.webp',
    //               describthion: 'High coverage to hide imperfections',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'lipstick',
    //               image: 'assets/images/حمرة ميبيلين.webp',
    //               describthion: 'Highly pigmented lipstick for a bold look',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Bronzer',
    //               image: 'assets/images/برونزر.jpg',
    //               describthion: 'Gives a golden color to the face',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Mascara',
    //               image: 'assets/images/مسكرة ميبيلين.webp',
    //               describthion: 'dark and solid ',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Makeup fixer',
    //               image: 'assets/images/مثبت ميبيلين.png',
    //               describthion: 'Moisturizes the face and fixes makeup',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //   ],
    // ),
    //
    //
    //
    // categories(
    //   name: 'jewelry',
    //   image: 'assets/images/gold.jpg',
    //   store: [
    //     stores
    //       (
    //         name: 'Pandora',
    //         image: 'assets/images/pandora.jpg',
    //         prod: [
    //           products(
    //               name: 'Neck collar',
    //               image: 'assets/images/عقدباندورا.jpg',
    //               describthion: 'Silver necklace with a stainless steel pink heart',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Ring',
    //               image: 'assets/images/خاتم باندورا.jpg',
    //               describthion: 'Silver ring with heart',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Bracelet',
    //               image: 'assets/images/اسوارة باندورا.jpg',
    //               describthion: 'Silver Bracelet',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Ear Ring',
    //               image: 'assets/images/حلق باندورا.jpg',
    //               describthion: 'Silver ear ring with heart',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Neck collar',
    //               image: 'assets/images/طوق باندورا.jpg',
    //               describthion: 'Silver necklace with silver flower',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Swarovski',
    //         image: 'assets/images/swaroveski.jpg',
    //         prod: [
    //           products(name: 'Ring',
    //               image: 'assets/images/خاتم سواروفسكي.jpeg',
    //               describthion: 'Gold Ring',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Neck collar',
    //               image: 'assets/images/سواروفسكي عقد.jpeg',
    //               describthion: 'Silver Neck collar with zircon',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Watch',
    //               image: 'assets/images/ساعة سواروفسكي.jpg',
    //               describthion: 'Silver and Blue',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Bracelet',
    //               image: 'assets/images/اسوارة سواروفسكي.jpg',
    //               describthion: 'Zircon Rings',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Set',
    //               image: 'assets/images/طقم سواروفسكي.jpeg',
    //               describthion: 'Silver earrings and necklace',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Fendi',
    //         image: 'assets/images/fendi.jpg',
    //         prod: [
    //           products(name: 'Bag',
    //               image: 'assets/images/fendibag.jpg',
    //               describthion: 'Made of leather with Fendi logo',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Watch',
    //               image: 'assets/images/fendiwatch.jpg',
    //               describthion: 'Black and Gold with Fendi logo',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Sun Glasses',
    //               image: 'assets/images/fendi glasses.webp',
    //               describthion: 'Great looking glasses with high sun protection',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Bracelet',
    //               image: 'assets/images/fendiswar.jpg',
    //               describthion: 'Gold and Silver',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Ring',
    //               image: 'assets/images/fendi rings.jpg',
    //               describthion: 'Gold and beutiful',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Prada',
    //         image: 'assets/images/prada.jpg',
    //         prod: [
    //           products(name: 'Bag',
    //               image: 'assets/images/bagg.webp',
    //               describthion: 'Made of leather ',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Wallet',
    //               image: 'assets/images/wallet.jpg',
    //               describthion: 'Black and Made of leather',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Sun Glasses',
    //               image: 'assets/images/pradaglasses.jpg',
    //               describthion: 'Great looking glasses with high sun protection',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Women Bracelet',
    //               image: 'assets/images/pradawomen.jpg',
    //               describthion: 'Pink and Made of leather',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Men Bracelet',
    //               image: 'assets/images/pradamen.webp',
    //               describthion: 'Black and Made of leather',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Gucci',
    //         image: 'assets/images/gucci.jpg',
    //         prod: [
    //           products(name: 'Bag',
    //               image: 'assets/images/baggucci.jpg',
    //               describthion: 'Made of leather ',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Watch',
    //               image: 'assets/images/gucciwatch.webp',
    //               describthion: 'Black Gold and Silver',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Sun Glasses',
    //               image: 'assets/images/gucciglasses.jpg',
    //               describthion: 'Great looking glasses with high sun protection',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Bracelet',
    //               image: 'assets/images/gucciswar.jpg',
    //               describthion: 'Multicolor',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Ring',
    //               image: 'assets/images/ringgucci.jpg',
    //               describthion: 'gold',
    //               price: 1000,
    //               quantity: '200')
    //         ]
    //     )
    //
    //   ],
    //
    // ),
    // categories(
    //   name: 'Food Stuffs',
    //   image: 'assets/images/super.jpg',
    //   store: [
    //     stores
    //       (
    //         name: 'Canned Food ',
    //         image: 'assets/images/معلبات.jpg',
    //         prod: [
    //           products(name: 'Tona',
    //               image: 'assets/images/تونة.jpg',
    //               describthion: 'Tuna fish and delicious',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Mortadella',
    //               image: 'assets/images/مرتديلا.jpg',
    //               describthion: 'Chicken mortadella',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Corn',
    //               image: 'assets/images/درة.jpg',
    //               describthion: 'Canned boiled corn',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Beans',
    //               image: 'assets/images/فول.jpg',
    //               describthion: 'boiled canned beans',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Chick Peas',
    //               image: 'assets/images/حمص.jpg',
    //               describthion: 'boiled canned chickpeas',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Types of bread ',
    //         image: 'assets/images/خبز.jpg',
    //         prod: [
    //           products(name: 'Toast',
    //               image: 'assets/images/توست.jpg',
    //               describthion: 'Toast is a type of toasted bread that has a crunchy crust and a delicious flavor',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Tortilla',
    //               image: 'assets/images/تورتيلا.jpg',
    //               describthion: 'Tortilla is a type of thin, flexible bread, commonly used to wrap fillings',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Tourist bread',
    //               image: 'assets/images/سياحي.jpg',
    //               describthion: 'Tourist bread is a type of soft and delicious bread, often used in making sandwiches',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Bread',
    //               image: 'assets/images/صمون.jpg',
    //               describthion: 'Samoon is a popular type of soft and delicious Indian bread',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Freanch bread',
    //               image: 'assets/images/فرنسي.jpg',
    //               describthion: 'French bread is a type of crispy, delicious bread, often with a unique flavour and usually served with cheese or jam',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Types of chocolate',
    //         image: 'assets/images/شوكولا.jpg',
    //         prod: [
    //           products(name: 'Nutella',
    //               image: 'assets/images/نوتيلا.jpg',
    //               describthion: 'Nutella is a delicious, creamy spread of chocolate and hazelnuts',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Kinder',
    //               image: 'assets/images/كندر.jpg',
    //               describthion: 'Kinder Chocolate is a delicious chocolate filled with a soft creamy filling',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Kit Kat',
    //               image: 'assets/images/كيتكات.jpg',
    //               describthion: 'KitKat chocolate is a small candy covered in a thin layer of chocolate',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Bounty',
    //               image: 'assets/images/باونتي.jpg',
    //
    //               describthion: 'Delicious chocolate filled with shredded coconut, covered in a layer of smooth and rich chocolate',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Twix',
    //               image: 'assets/images/تويكس.webp',
    //               describthion: 'Delicious chocolate with layers of caramel and crunchy biscuits',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Types of chips',
    //         image: 'assets/images/شيبس.jpg',
    //         prod: [
    //           products(name: 'Liz',
    //               image: 'assets/images/ليز.jpg',
    //               describthion: 'Delicious chips with different flavors',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Pringles',
    //               image: 'assets/images/برنجلز.jpg',
    //               describthion: 'Delicious chips with different flavors',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Cheetos',
    //               image: 'assets/images/شيتوس.jpg',
    //               describthion: 'Delicious chips with different flavors',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Doritos',
    //               image: 'assets/images/دوريتوس.jpg',
    //               describthion: 'Delicious chips with different flavors',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Ruffles',
    //               image: 'assets/images/رفلز.jpg',
    //               describthion: 'Delicious chips with different flavors',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     ),
    //     stores
    //       (
    //         name: 'Types of drinks',
    //         image: 'assets/images/مشروبات.jpg',
    //         prod: [
    //           products(name: 'Red Bull',
    //               image: 'assets/images/ردبول.jpg',
    //               describthion: 'Energy drink',
    //               price: 1000,
    //               quantity: '20'),
    //           products(name: 'Coca-Cola',
    //               image: 'assets/images/كوكاكولا.jpg',
    //               describthion: 'Soft drink',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Orange juice',
    //               image: 'assets/images/برتقال.jpg',
    //               describthion: 'Delicious natural orange',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: '7 Up',
    //               image: 'assets/images/سفن اب.jpg',
    //               describthion: 'Soft drink',
    //               price: 1000,
    //               quantity: '200'),
    //           products(name: 'Pepsi',
    //               image: 'assets/images/بيبسي.jpg',
    //               describthion: 'Soft drink',
    //               price: 1000,
    //               quantity: '200'),
    //         ]
    //     )
    //
    //   ],
    //
    // ),
  ];
 // late List <products> pro;
  //late List<stores>store;

  /*List proo = [
      "wael",
      "ahmad",
      "jamal",
      "hazem",
      "masa",
      "yazan",
      "ali",
    ];*/

    List? filterlist ;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [

      IconButton(onPressed: ()
      {
        query="";
      }, icon: Icon(Icons.close ))
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(onPressed: ()
    {
      close(context, null);
    },
        icon: Icon(Icons.arrow_back));
    }
  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder
      (
        itemCount:categorie.length ,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.all(20.0),

            child: ListTile(
              title:Row(
                children: [
                  Expanded(
                    child: Text(

                      categorie[index].name??"",

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: ()
                      {
                        print(" ");
                      },
                      icon: CircleAvatar(
                        radius: 20,

                        child: Icon(
                          Icons.favorite_border,
                          size: 22,),
                      )
                  ) ],

              ),


              leading:CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(categorie[index].photo??""),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => discribthionScreen(
                    p:categorie[index] ,

                  )),
                );

              },
            ),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query=="")
      {
        // return ListView.builder
        //   (
        //     itemCount:categorie.length ,
        //     itemBuilder: (context,index)
        //     {
        //       return Padding(
        //         padding: const EdgeInsets.all(20.0),
        //
        //         child: ListTile(
        //           title:Row(
        //             children: [
        //               Expanded(
        //                 child: Text(
        //
        //                   categorie[index].name??"",
        //
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 25,
        //
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               Spacer(),
        //               IconButton(
        //                   onPressed: ()
        //                   {
        //                     print(" ");
        //                   },
        //                   icon: CircleAvatar(
        //                     radius: 20,
        //
        //                     child: Icon(
        //                       Icons.favorite_border,
        //                       size: 22,),
        //                   )
        //               ) ],
        //
        //           ),
        //
        //
        //           leading:CircleAvatar(
        //             radius: 30,
        //             backgroundImage: NetworkImage(categorie[index].photo??""),
        //           ),
        //           onTap: (){
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => discribthionScreen(
        //                 p:categorie[index] ,
        //
        //               )),
        //             );
        //
        //           },
        //         ),
        //       );
        //     }
        // );
        return Center(child: Text("Search for a Product",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),));
      }
    else {
      getSearch(query);
      return ListView.builder
        (
          itemCount:categorie.length ,
          itemBuilder: (context,index)
          {
            return Padding(
              padding: const EdgeInsets.all(20.0),

              child: ListTile(
                title:Row(
                  children: [
                    Expanded(
                      child: Text(

                        categorie[index].name??"",

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: ()
                        {
                          print(" ");
                        },
                        icon: CircleAvatar(
                          radius: 20,

                          child: Icon(
                            Icons.favorite_border,
                            size: 22,),
                        )
                    ) ],

                ),


                leading:CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(categorie[index].photo??""),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => discribthionScreen(
                      p:categorie[index] ,

                    )),
                  );

                },
              ),
            );
          }
      );
    }

  }
  getSearch(query)async{
    var data=await search_products(query);
    //print(data);
    categorie=data;
    print(categorie);
  }
}