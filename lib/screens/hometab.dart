


import 'package:astrotak_assignment/screens/askaquestion.dart';
import 'package:astrotak_assignment/widgets/myprofile.dart';
import 'package:astrotak_assignment/widgets/orderhistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
int _currentIndex = 0;
class HomeTab extends StatefulWidget{

  @override
  _HomeTabState createState()=>_HomeTabState();
}

class _HomeTabState extends State<HomeTab>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      initialIndex: 2,
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: Image.asset('assets/hamburger.png'),

              iconTheme: IconThemeData(
                color: Colors.orange, //change your color here
              ),

              title: Image.asset('assets/astrologo.png',
                fit: BoxFit.fitHeight,
                height: 48,
              ),
              actionsIconTheme: IconThemeData(size: 24),
              actions: [
                InkWell(onTap: (){

                  Navigator.of(context).pushNamed('profile');

                },
                    child:
                    Container(
                      height: 42,
                      padding: EdgeInsets.all(12),
                      child:  Image.asset('assets/profile.png',
                        fit: BoxFit.scaleDown,
                        height: 18,),
                    ))
              ],
              backgroundColor: Colors.white,
            ),
            body: TabBarView(
              children: [
            Container(color:Colors.white,child: Center(child: Text('Home'),),),
            Container(color:Colors.white,child: Center(child: Text('Talk'),),),
            AskQuestion(),
            Container(color:Colors.white,child: Center(child: Text('Reports'),),),
            Container(color:Colors.white,child: Center(child: Text('Chat'),),),
              ],
            ),
        bottomNavigationBar:  Container(
          padding: EdgeInsets.symmetric(vertical: 6),
             height: 62,
             child:TabBar(

          unselectedLabelColor:  Colors.grey,
          // unselectedLabelStyle:  TextStyle(color: Colors.grey),
          labelStyle: GoogleFonts.lato(fontSize: 12),
      labelPadding: EdgeInsets.zero,
      labelColor: Colors.orange.shade600,
      indicatorColor: Color.fromRGBO(0, 0, 0, 0),
      tabs: [
        Tab(
          icon: ImageIcon(AssetImage('assets/home.png',)),
          text: 'Home',),
        Tab(
          icon:ImageIcon(AssetImage('assets/talk.png',)),
          text: 'Talk',),
        Tab(
          icon: ImageIcon(AssetImage('assets/ask.png',)),
          text: 'Ask Question',),
        // child: Expanded(child:Text('Ask Question',maxLines: 1,)),),
        Tab(
          icon: ImageIcon(AssetImage('assets/reports.png',)),
          text: 'Reports',),
        Tab(
          icon: ImageIcon(AssetImage('assets/chat.png',)),
          text: 'Chat',),
      ],
    ),
           ),


        ));
  }
}