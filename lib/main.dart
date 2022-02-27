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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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



