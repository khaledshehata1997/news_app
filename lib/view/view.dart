import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/bottom_nav_bar/sports.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_bar/health.dart';
import 'bottom_nav_bar/scince.dart';


class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  List<Widget> screens=[
    Sports(),
    science(),
    Health()
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text.rich(TextSpan(
          children: [
            TextSpan(
              text: 'N',
              style: TextStyle(fontSize: 30,color: Colors.orange)
            ) , TextSpan(
              text: 'e',
              style: TextStyle(fontSize: 23,color: Colors.blue)
            ) , TextSpan(
              text: 'w',
              style: TextStyle(fontSize: 23,color: Colors.pink)
            ) , TextSpan(
              text: 's',
              style: TextStyle(fontSize: 23,color: Colors.green)
            ),
            TextSpan(
                text: 'App',
                style: TextStyle(fontSize: 18,color: Colors.white)
            ),
          ]
        ),

        )
      ),
     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.black,
       selectedItemColor: Colors.orange,
       unselectedItemColor: Colors.white,
       currentIndex: index,
       onTap: (val){
         setState(() {
           index=val;
         });
       },
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.sports_baseball,),label: 'sports'),
         BottomNavigationBarItem(icon: Icon(Icons.science,),label: 'science'),
         BottomNavigationBarItem(icon: Icon(Icons.health_and_safety,),label: 'health')
       ],
     ),
      body: screens[index],
    );
  }
}
