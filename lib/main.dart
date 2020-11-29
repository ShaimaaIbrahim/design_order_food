import 'dart:collection';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:order_food/DetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.cyan,

      body: ListView(

        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {

                    }),
                Container(
                  width: 150.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(

              padding: EdgeInsets.only(left: 40.0),

              child: Row(

                children: <Widget>[
                  Text(
                    "Restaurant",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Food",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ],
              )),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              children: <Widget>[
               Padding(
                 padding: EdgeInsets.only(top: 45.0),

                 child: Container(

                 height: MediaQuery.of(context).size.height-300,
                 child: ListView(

                 children: <Widget>[
                        _BuildFoodItem("assets/food.png", "plate one", "25 &"),
                        _BuildFoodItem("assets/food.png", "plate one", "25 &"),
                        _BuildFoodItem("assets/food.png", "plate one", "25 \$"),
                        _BuildFoodItem("assets/food.png", "plate one", "25 \$"),
                        _BuildFoodItem("assets/food.png", "plate one", "25 \$"),
                        _BuildFoodItem("assets/food.png", "plate one", "25 \$"),
                        _BuildFoodItem("assets/food.png", "plate one", "25 \$"),
                        _BuildFoodItem("assets/food.png", "plate one", "25 \$"),
                      ],
                 ),
                 ),
               ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _BuildFoodItem (String imgPath , String foodName , String price){

  return Padding(

  padding: EdgeInsets.only(left: 10.0 , right: 10.0 , top: 10.0),

  child: InkWell(

    onTap: (){

   Navigator.of(context).push (MaterialPageRoute(
     builder: (context) => DetailPage(imgPath , foodName , price)
   ));
    },
    child: Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[
        Container(

         child: Row(

         children: <Widget>[
           // for hero animations
          Hero(
            tag: imgPath,
            child: Image(
              image: AssetImage(imgPath),
              fit: BoxFit.cover,
              height: 75.0,
              width: 75.0,
            ),
          ),
          SizedBox(
           width: 10.0,
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[

          Text(foodName ,
           style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 17.0
          ),),
            Text(price ,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                color: Colors.grey
              ),),
          ],
          ),
        ],
         ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          color : Colors.black,
          onPressed: (){
            },
        ),

      ],
    ),
  ),
  );
}
}
