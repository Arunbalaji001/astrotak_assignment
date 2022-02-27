


import 'package:astrotak_assignment/widgets/myprofile.dart';
import 'package:astrotak_assignment/widgets/orderhistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget{

  @override
  _ProfilePageState createState()=>_ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
            color: Colors.orange, //change your color here
          ),
    bottom: const TabBar(labelStyle: TextStyle(color: Colors.orange),
    labelColor: Colors.orange,
    indicatorColor: Colors.orange,
    tabs: [
    Tab(text: 'My Profile',),
      Tab(text: 'Order History',),
    ],
    ),
    title: Image.asset('assets/astrologo.png',
    fit: BoxFit.fitHeight,
    height: 48,
    ),
    actionsIconTheme: IconThemeData(size: 24),
    actions: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child: Center(
          child:Text('Logout',
            style: GoogleFonts.roboto(color: Colors.orange,fontSize: 12,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
    backgroundColor: Colors.white,
    ),
    body:  TabBarView(
    children: [
   MyProfile(),
    orderhistory(),
    ],
    ),
    floatingActionButton:
    InkWell(
      onTap:()=>Navigator.pushNamed(context, 'profileform'),
      child:
      Container(
        height: 32,
        width: MediaQuery.of(context).size.width*.5,
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
    children:[
      Icon(
        Icons.add,
        color: Colors.white,
      ),
         Text('Add New Profile',
            style: GoogleFonts.roboto(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        ));


  }
}


