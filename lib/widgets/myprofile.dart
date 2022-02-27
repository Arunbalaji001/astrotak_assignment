import 'package:astrotak_assignment/models/relation.dart';
import 'package:astrotak_assignment/providers/relatiosprovider.dart';
import 'package:astrotak_assignment/screens/editprofileformpage.dart';
import 'package:astrotak_assignment/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget{

  @override
  _MyProfileState createState()=>_MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool selx=false;
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  void initState(){
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<RelationsProvider>(context,listen:false).getrelations();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      child:Column(
        children: [
          Container(
            height: 42,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                  Expanded(child:
                  InkWell(onTap: ()=>setState(() {
                   if(!selx)
                     {selx=true;}
                  }),
                    child:
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                  height: 32,
                  decoration: BoxDecoration(
                      color: selx?Colors.orange:Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: Center(
                    child:Text('Basic Profile',
                      style: GoogleFonts.roboto(color: selx?Colors.white:Colors.blue,fontSize: 12,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                  ),
                ),

                Expanded(child:
                InkWell(
                  onTap:()=>setState(() {
                    if(selx)
                    {selx=false;}
                  }),
                  child:
                Container(
                  height: 32,
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                  decoration: BoxDecoration(
                      color: selx?Colors.white:Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: Center(
                    child:Text('Friends & Family Profile',
                      style: GoogleFonts.roboto(color: selx?Colors.blue:Colors.white,fontSize: 12,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                ),
                ),
              ],
            ),
          ),



          Container(

            height: 42,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Color.fromRGBO(75, 96, 188, 0.25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.account_balance_wallet_outlined,color: Colors.blue.shade800,),
                SizedBox(width: 8,),
                Text('Wallet Balance : \u{20B9} 0',
                  style: GoogleFonts.roboto(color: Colors.blue.shade800,fontSize: 12,fontWeight: FontWeight.w600),),
                SizedBox(width: 8,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: Colors.black,width: 0.5)
                  ),
                  child: Center(
                    child:Text('Add Money',
                      style: GoogleFonts.roboto(color: Colors.blue.shade800,fontSize: 12,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

              ],
            ),
          ),
        Container(
          height: 36,
          margin: EdgeInsets.symmetric(horizontal: 12),

          padding: EdgeInsets.symmetric(horizontal: 12,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child:
              Text('Name',

                style: GoogleFonts.roboto(
                    color: Colors.blue.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              ),
              Expanded(child:
              Text('DOB',
                style: GoogleFonts.roboto(
                    color: Colors.blue.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              ),

              Expanded(child:
              Text('TOB',
                style: GoogleFonts.roboto(
                    color: Colors.blue.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              ),

              Expanded(child:
              Text('Relation',
                style: GoogleFonts.roboto(
                    color: Colors.blue.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              ),
              Icon(Icons.edit,color: Colors.white.withOpacity(0),),
              SizedBox(width: 18,),
              Icon(Icons.delete,color: Colors.white.withOpacity(0))

            ],
          ),
        ),
        Expanded(child:
        Container(
        child:Consumer<RelationsProvider>(
          builder: (context, model, child) {
            print('Stat ::'+model.xty.toString());
            if (model.xty == apistat.success) {
              List<Relatives> bvx=model.xtz!.allRelatives!;
              return Container(

                child:
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    String fname=capitalize(bvx[index].fullName??'No Name');
                    String dob=bvx[index].birthDetails!=null?bvx[index].birthDetails!.dobDay.toString()+'-'
                        +bvx[index].birthDetails!.dobMonth.toString()+'-'
                    +bvx[index].birthDetails!.dobYear.toString()
                        :'';
                    String place=bvx[index].birthDetails!=null?bvx[index].birthDetails!.tobHour.toString()+':'+bvx[index].birthDetails!.tobMin.toString():'';
                    String relation=bvx[index].relation!=null?bvx[index].relation.toString():'';
                    return Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade400,blurRadius: 2,spreadRadius: 0.5)
                        ]
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child:
                          Text(fname,
                            style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          ),
                    Expanded(child:
                    Text(dob,
                            style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                    ),

                    Expanded(child:
                    Text(place,
                            style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          ),

                          Expanded(child:
                    Text(relation,
                            style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          ),
                   InkWell(
                    onTap: (){
                      Relatives xcz=bvx[index];
                      if(xcz!=null){
                        model.setrelative(xcz);
                     Navigator.pushNamed(context, 'editprofileform');
                      }
                    },
                    child:Icon(Icons.edit),),
                          SizedBox(width: 18,),
                          bvx[index].deleting?SizedBox(
                            width: 24,
                            height: 24,
                            child: Center(
                              child: CircularProgressIndicator(color: Colors.red,),
                            ),
                          ):InkWell(
                            onTap:(){
                              // model.deleterelation(bvx[index].uuid.toString());
                              showAlertDialog(context,bvx[index].uuid.toString());
                            },
                          child:
                          Icon(Icons.delete,color: Colors.red,)),

                          index==model.xtz!.allRelatives!.length-1? SizedBox(height: 42,):Container()
                        ],
                      ),
                    );
                  },
                  itemCount: model.xtz!.allRelatives!.length,
                ),);
            }
            else{
               return SizedBox(

                  height: 250.0,
                  child:Column(
                    children: [
                      SizedBox(height: 10,),
                      Loaderx.rectangular(height: 50),
                      SizedBox(height: 10,),
                      Loaderx.rectangular(height: 50),
                      SizedBox(height: 10,),
                      Loaderx.rectangular(height: 50),
                      SizedBox(height: 10,),
                      Loaderx.rectangular(height: 50),
                      SizedBox(height: 10,),

                    ],
                  )
              );
            }
          })
          )),
        ],
      ),
    );
  }


  showAlertDialog(BuildContext context,String uuid) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content:
      Wrap(
        children: [
        Text("Do you really want to delete?"),
        SizedBox(height: 12,),
        Row(
          children:[
        Expanded(child:
        ElevatedButton(
          child: Text("YES"),
          onPressed: () {
            Provider.of<RelationsProvider>(context,listen: false).deleterelation(uuid.toString());
            Navigator.of(context).pop();
          },
        ),),
        SizedBox(width: 6,),
        Expanded(child:
        ElevatedButton(
          child: Text("NO"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ))
            ])
      ],),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
