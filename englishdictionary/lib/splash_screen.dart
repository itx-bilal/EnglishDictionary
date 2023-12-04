import 'dart:async';

import 'package:englishdictionary/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151A78),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.book_outlined,size: 180,color: Color(0xff82ABE1),),
              Text('English to English',style: TextStyle(fontSize: 30,color: Color(0xff82ABE1)),),
              Text('Dictionary',style: TextStyle(fontSize: 30,color: Color(0xff82ABE1)),)
            ],
          ),
        ),
      )
    );
  }
}