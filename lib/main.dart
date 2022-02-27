import 'package:astrotak_assignment/models/askaquestion.dart';
import 'package:astrotak_assignment/providers/questionprovider.dart';
import 'package:astrotak_assignment/providers/relatiosprovider.dart';
import 'package:astrotak_assignment/screens/askaquestion.dart';
import 'package:astrotak_assignment/screens/editprofileformpage.dart';
import 'package:astrotak_assignment/screens/hometab.dart';
import 'package:astrotak_assignment/screens/profile.dart';
import 'package:astrotak_assignment/screens/profileformpage.dart';
import 'package:astrotak_assignment/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    MultiProvider(providers: [
        ChangeNotifierProvider(create:(_)=>RelationsProvider(),),
        ChangeNotifierProvider(create:(_)=>QuestionProvider(),),
    ],
    child:
      MaterialApp(
      title: 'Astro Tak',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.orange, //change your color here
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ).apply(
          bodyColor: Colors.orange,
          displayColor: Colors.blue,
        ),

      ),
      routes: {
        'hometab':(_)=>HomeTab(),
        'profile':(_)=>ProfilePage(),
        'profileform':(_)=>ProfileFormPage(),
        'editprofileform':(_)=>EditProfileFormPage(),
      },
      home: SplashScreen(),

    ));
  }
}



