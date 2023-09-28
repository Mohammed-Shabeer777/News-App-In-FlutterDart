import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flash News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: AnimatedSplashScreen(
          splash: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.electric_bolt_sharp,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Flash News',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'PEPSI'),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          nextScreen: Home()),
    ),
  );
}
