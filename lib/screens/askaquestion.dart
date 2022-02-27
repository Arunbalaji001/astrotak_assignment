


import 'package:astrotak_assignment/models/askaquestion.dart';
import 'package:astrotak_assignment/providers/questionprovider.dart';
import 'package:astrotak_assignment/providers/relatiosprovider.dart' as xtr;
import 'package:astrotak_assignment/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AskQuestion extends StatefulWidget{

  @override
  _AskQuestion createState()=>_AskQuestion();
}

class _AskQuestion extends State<AskQuestion>{
  final editorx=TextEditingController();
  int count=0;
  @override
  void initState(){

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<QuestionProvider>(context,listen: false).getcatgs();

    });
    super.initState();
  }
  String value='Love';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: SafeArea(
    child:Stack(
    children:[
    Container(
      padding: EdgeInsets.only(top: 42),
          color: Colors.white,
          child: Column(
              children: [
          Container(

            color: Colors.white,
            child:
            Column(
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text('Ask a Question',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Choose Category',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Consumer<QuestionProvider>(builder: (context,model,child){
                      if(model.questioncategories!=null&&model.questioncategories!.data!=null&&model.vty==apistat.success) {
                    Future.delayed(Duration.zero,()=>model.setselected(value));
                             return Container(
                        height: 42,
                        padding: EdgeInsets.symmetric(horizontal: 8
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [ BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 2,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )],
                        ),
                        child:DropdownButton<String>(
                        isExpanded: true,
                            hint: Text('Select a Category'),
                            value: value,
                            underline: Container(),
                            items: model.questioncategories!.data?.map((e) {
                              return DropdownMenuItem<String>(
                                value: e.name.toString(),
                                child: Text(e.name.toString()),
                              );
                            }).toList(), onChanged: (newValue) {
                          model.setselected(newValue.toString());
                          setState(() {
                            value = newValue.toString();
                          });
                        }),);
                      }
                      else{
                        return SizedBox(

                          height: 42.0,
                          child:Loaderx.rectangular(height: 100)
                        );
                      }
                    }),
                    SizedBox(
                      height: 8,
                    ),

                  TextField(
                    maxLines: 6,
                  minLines: 5,
                    maxLength: 150,
                    controller: editorx,
                    decoration: InputDecoration(
                      hintText: 'Type a question here',
                      border: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),

                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text('Ideas What to Ask (Select Any)',
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),

            ],
          ),),
        Expanded(child:
           Container(
             padding: EdgeInsets.symmetric(horizontal: 6),
              // constraints: BoxConstraints(
              //     minHeight: 200,
              //     maxHeight: (MediaQuery.of(context).size.height-MediaQuery.of(context).viewInsets.vertical)*0.35),
             child:SingleChildScrollView(
               child:Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:[
                     Consumer<QuestionProvider>(builder: (context,model,child){
                       if(model.vty==apistat.success) {
                         var contains = model.questioncategories!.data?.where((
                             element) => element.selected);
                         if (contains != null && contains.isNotEmpty) {
                           Data? selected = model.questioncategories!.data!
                               .singleWhere((element) => element.selected);
                           if (selected != null && selected.suggestions != null) {
                             return

                             ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               scrollDirection: Axis.vertical,
                                 shrinkWrap: true,
                                 itemBuilder: (context, index) {
                                 return InkWell(onTap: ()=>editorx.text=selected.suggestions![index]
                                     .toString(),
                                   child:Container(
                                   width: MediaQuery
                                       .of(context)
                                       .size
                                       .width,
                                   height: 54,
                                   padding: EdgeInsets.symmetric(vertical: 12),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       border: Border(bottom: BorderSide(color: Colors.blueGrey,width: 0.5))
                                   ),
                                   child: Row(
                                       children:[
                                         Image.asset('assets/qicon.png',width: 32,height: 32,),
                                         SizedBox(width: 16,),
                                         Expanded(
                                           child:
                                         Text(
                                           selected.suggestions![index]
                                               .toString(),
                                           style: GoogleFonts.roboto(
                                               color: Colors.black,
                                               fontSize: 12,
                                               fontWeight: FontWeight.w400),
                                         ),
                                         ),

                                       ]),
                                 ),);
                               }, itemCount: selected.suggestions!.length,);
                           }
                           else {
                             return Container();
                           }
                         }
                         else {
                           // Future.delayed(Duration.zero,()=>  model.setselected(value));
                           return Container();
                         }
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
                     }),

                     SizedBox(height: 16,),
                     Text(
                       'Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.',
                       style: GoogleFonts.roboto(
                           color: Colors.black,
                           fontSize: 12,
                           fontWeight: FontWeight.w400),
                     ),
                     SizedBox(height: 16,),
                     Container(
                       color: Color.fromRGBO(255, 241, 232, 1.0),
                       margin: EdgeInsets.symmetric(horizontal: 6),
                       padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children:[
                           Text(
                         '• Personalized responses provided by our team of vedic astrologers within 24 hours.',
                         style: GoogleFonts.roboto(
                             color:Color.fromRGBO(255, 148, 77, 1.0),
                             fontSize: 12,
                             fontWeight: FontWeight.w400),
                       ),
                       Text('• Qualified and experirnced atrologers will look into  your birth chart and provide the right guidance.',
                           style: GoogleFonts.roboto(
                           color: Color.fromRGBO(255, 148, 77, 1.0),
                           fontSize: 12,
                           fontWeight: FontWeight.w400),
                       ),
                       Text('• You can seek answers to any part of your life and for most pressing issues.',
                         style: GoogleFonts.roboto(
                             color: Color.fromRGBO(255, 148, 77, 1.0),
                             fontSize: 12,
                             fontWeight: FontWeight.w400),
                       ),
                       Text('• Our team of Vedic astrologers will not just provide answers but also suggest a remedial solution.',
                         style: GoogleFonts.roboto(
                             color:Color.fromRGBO(255, 148, 77, 1.0),
                             fontSize: 12,
                             fontWeight: FontWeight.w400),
                       ),


                       ]
                     ),
                     ),
                     SizedBox(height: 60,),

      ]),
             ),),),
]),),

      Positioned(
        top: 0,
        child:
        Container(
          color: Color.fromRGBO(75, 96, 188, 1.0),
          height: 42,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Wallet Balance : \u{20B9} 0',
                style: GoogleFonts.roboto(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Center(
                  child:Text('Add Money',
                    style: GoogleFonts.roboto(color: Colors.blue.shade800,fontSize: 12,fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ],
          ),
        ),),

      Positioned(
        bottom: 0,
        child:
      Container(
        color: Color.fromRGBO(75, 96, 188, 1.0),
        height: 42,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(' \u{20B9} 150 (Ask 1 Question on Love)',
              style: GoogleFonts.roboto(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black,width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(4))
              ),
              child: Center(
                child:Text('Ask Now',
                  style: GoogleFonts.roboto(color: Colors.blue.shade800,fontSize: 12,fontWeight: FontWeight.w500),
                ),
              ),
            ),


          ],
        ),
      ),
      ),
      ],),),

    );


  }


}