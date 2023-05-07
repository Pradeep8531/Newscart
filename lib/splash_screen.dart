import 'dart:async';

import 'package:flutter/material.dart';
import 'package:krishicare/views/home.dart';

import 'main.dart';

class splash_screen extends StatefulWidget{
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
    });

    /*Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage())
      );
    });*/



  }

  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Container(
            /*decoration: const BoxDecoration(
            image: DecorationImage(
             image: AssetImage('assets/images/bi.jpeg'),
                fit: BoxFit.cover
            )
          ),*/
            child: CircleAvatar(
              radius: 100,
              child: Center(
                  child: Image.asset('assets/images/splashback.png')
              ),
            ),
            /*Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Text('BMI tells you how "BIG" you are, Not how "sick" you are',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade50,
                  fontSize: 20
                ),
            ),
              )
          ),*/

          ),
        )

    );
  }
}