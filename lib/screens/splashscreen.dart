

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.popAndPushNamed(context, 'hometab');
    });
    // TODO: implement build
    return Container(
      color: Colors.white,
      child:Center(
        child:Image.asset('assets/astrologo.png',height: 80,),
      ),
    );
  }
}