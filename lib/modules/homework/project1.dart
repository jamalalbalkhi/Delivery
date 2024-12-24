import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/homework/result.dart';
class product {
  final String name;
  final int id;
  final String image;
  final String discreption;

  product({
    required this.name,
    required this.id,
    required this.discreption,
    required this.image,


  }
      );
}
class productitem extends StatelessWidget {
  List<product> p=
  [

    product(name: 'Kia Rio',
      id: 1,
      discreption: 'The Kia Rio is a compact family sports car It was first launched in 2017 and features a modern and dynamic design',
      image: 'images/rio.jpg',

    ),
    product(
      name: 'Mercedes',
      id: 2,
      discreption: 'Mercedes is characterized by its elegant design and luxurious luxury thanks to its modern technologies',
      image: 'images/marceds.jpg',

    ),
    product(
      name: 'porsche',
      id: 3,
      discreption: 'Porsche cars are characterized by powerful engines and excellent sports performance. Porsche provides a distinctive driving experience that combines luxury and power',
      image: 'images/borsh.jpg',

    ),
    product(
      name: 'BMW',
      id: 4,
      discreption: 'BMW offers advanced technology that makes the driving experience more comfortable and safe. BMW is a symbol of innovation and high quality and provides a distinctive driving experience for lovers of luxury and sports cars',
      image: 'images/bmw.jpg',


    ),
    product(
      name:'Ferrari',
      id: 5,
      discreption: 'Ferrari cars are among the most famous and distinctive sports cars in the world, featuring powerful engines and advanced suspension systems that provide exceptional performance on the road and track',
      image: 'images/firari.jpg',

    ),
    product(
      name: 'Toyota',
      id: 6,
      discreption: 'With Toyota, a wide range of vehicles are available to meet the needs of different customers, from economy cars to SUVs and hybrids. Toyota cars are known for providing a comfortable and practical driving experience',
      image: 'images/toyota.jpg',

    ),
    product(
      name: 'Range Rover',
      id: 7,
      discreption: 'The Range Rover is among the top-of-the-line models in the Land Rover family of four-wheel drive vehicles. Range Rover vehicles are available with powerful engines that provide excellent performance and stability on rough roads',
      image: 'images/range.jpg',

    ),
    product(
      name: 'Tesla',
      id: 8,
      discreption: 'Tesla is one of the most important players in the electric car industry, offering a variety of models with long driving range and fast performance. Tesla also features advanced self-driving technologies that provide a safe and comfortable driving experience',
      image: 'images/tesla.jpg',

    ),
  product(name: 'Kia Rio',
  id: 1,
  discreption: 'The Kia Rio is a compact family sports car It was first launched in 2017 and features a modern and dynamic design',
  image: 'images/rio.jpg',

  ),
  product(
  name: 'Mercedes',
  id: 2,
  discreption: 'Mercedes is characterized by its elegant design and luxurious luxury thanks to its modern technologies',
  image: 'images/marceds.jpg',

  ),
  product(
  name: 'porsche',
  id: 3,
  discreption: 'Porsche cars are characterized by powerful engines and excellent sports performance. Porsche provides a distinctive driving experience that combines luxury and power',
  image: 'images/borsh.jpg',

  ),
  product(
  name: 'BMW',
  id: 4,
  discreption: 'BMW offers advanced technology that makes the driving experience more comfortable and safe. BMW is a symbol of innovation and high quality and provides a distinctive driving experience for lovers of luxury and sports cars',
  image: 'images/bmw.jpg',

  )

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('PRODUCT',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context,index)=>Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
        itemCount:p.length,
        itemBuilder: (context,index){return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            title: Text(p[index].name,style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
            leading:
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(p[index].image,),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => result(m: p[index],)),
              );
            },
          ),
        );
        },
      ),
    );

  }
}