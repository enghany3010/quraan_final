import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/HomeTappedPage.dart';


void main(){
  runApp(StartScreen());

}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "التسبيح والقراءن كامل",
      debugShowCheckedModeBanner: false,
      home: _StartScreen(),
    );
  }
}

class _StartScreen extends StatefulWidget {
  @override

  startscreen createState() => startscreen();
}

class startscreen extends State<_StartScreen> {
  // final User user;


  BoxDecoration _maingroundDecoration() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/lunch.png')
        ),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple,
              Colors.blueAccent,
              Colors.red
            ])
    );
  }

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>HomeTappedPage()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: _maingroundDecoration(),
    );
  }
}

