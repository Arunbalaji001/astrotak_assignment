


import 'package:astrotak_assignment/models/place.dart';
import 'package:astrotak_assignment/models/relation.dart';
import 'package:astrotak_assignment/providers/relatiosprovider.dart';
import 'package:astrotak_assignment/widgets/myprofile.dart';
import 'package:astrotak_assignment/widgets/orderhistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileFormPage extends StatefulWidget{

  @override
  _ProfileFormPageState createState()=>_ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage>{
  final _formKey = GlobalKey<FormState>();
  Placez? selectedplace=null;
  bool ampm=false;
  bool loading=false;
  final namectrler=TextEditingController();
  final dayctrler=TextEditingController();
  final monthctrler=TextEditingController();
  final yearctrler=TextEditingController();
  final hourctrler=TextEditingController();
  final mintsctrler=TextEditingController();
  String dropdownvalue = 'MALE';
  var items = [
    'MALE',
    'FEMALE',
  ];
  String dropdownvalue2 = 'Brother';
  var items2 = [
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Spouse',
    'Son',
    'Daughter',
    'Father in Law',
    'Mother in Law',
    'Brother in Law',
    'Sister in Law',
    'Daughter in Law'
    'Uncle',
    'Aunt',
    'Friend',
    'Fiance'

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: true,

            iconTheme: IconThemeData(
              color: Colors.orange, //change your color here
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
          body: SafeArea(
                child:Container(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(

                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(12, 12, 12, MediaQuery.of(context).viewInsets.bottom),
                  child:
                  Container(
                    constraints: BoxConstraints(maxWidth: 500),
                  child:
                  Form(
                    key:_formKey,
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                      child:
                  Text('Add New Profile',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),),
                  SizedBox(height: 16,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child:
                  Text('Name',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                    ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: namectrler,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field cannot be empty';
                      }

                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration:InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                      ),
                      border:OutlineInputBorder(),
                    hintText: 'Name of the person'),

                  ),
                  SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child:
                    Text('Date of Birth',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child:
                      TextFormField(
                        controller: dayctrler,
                        validator: (value) {
                          int valx=(value != null && value.isNotEmpty)?int.
                          parse(value.toString()):0;
                          if (value == null || value.isEmpty) {
                            return 'Enter date';
                          }
                          else if(valx<1||valx>31)
                            {
                              return 'Enter valid date';
                            }
                          else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                            ),
                            border:OutlineInputBorder(),
                            hintText: 'DD'),

                      ),
                      ),
                SizedBox(width: 12,),
                Expanded(child:

                TextFormField(
                  controller: monthctrler,
                        validator: (value) {
                          int valx=(value != null && value.isNotEmpty)?int.parse(value.toString()):0;
                          if (value == null || value.isEmpty) {
                            return 'Enter month';
                          }
                          else if(valx<1||valx>12)
                          {
                            return 'Check month';
                          }
                          else {
                            return null;
                          }
                        },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                            ),
                            border:OutlineInputBorder(),
                            hintText: 'MM'),

                      ),
                ),
                      SizedBox(width: 12,),

                      Expanded(child:

                TextFormField(
                  controller: yearctrler,
                        validator: (value) {
                          int valx=(value != null && value.isNotEmpty)?int.parse(value.toString()):0;

                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          else if(valx<1000||valx>2022)
                          {
                            return 'Enter valid year';
                          }
                          else {
                            return null;
                          }
                        },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                            ),
                            border:OutlineInputBorder(),
                            hintText: 'YYYY'),

                      ),
                ),
                    ],
                  ),
                  ),


                  SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child:
                    Text('Time of Birth',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(child:

                        TextFormField(
                          controller: hourctrler,
                          validator: (value) {
                            int valx=(value != null && value.isNotEmpty)?int.parse(value.toString()):0;
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            else if(valx<1||valx>12)
                            {
                              return 'Enter valid hour';
                            }
                            else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)
                              ),
                              border:OutlineInputBorder(),
                              hintText: 'HH'),

                        ),
                        ),
                        SizedBox(width: 12,),

                        Expanded(child:

                        TextFormField(
                          controller: mintsctrler,
                          validator: (value) {
                            int valx=(value != null && value.isNotEmpty)?int.parse(value.toString()):0;

                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            else if(valx<1||valx>59)
                            {
                              return 'Enter valid minutes';
                            }
                            else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)
                              ),
                              border:OutlineInputBorder(),
                              hintText: 'MM'),

                        ),
                        ),
                        SizedBox(width: 12,),
                        Container(

                          height: 42,
                          width: 120,
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
                                if(!ampm)
                                {ampm=true;}
                              }),
                                child:
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: ampm?Colors.blue:Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(4))
                                  ),
                                  child: Center(
                                    child:Text('AM',
                                      style: GoogleFonts.roboto(color: ampm?Colors.white:Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              ),

                              Expanded(child:
                              InkWell(
                                onTap:()=>setState(() {
                                  if(ampm)
                                  {ampm=false;}
                                }),
                                child:
                                Container(
                                  height: 32,
                                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: ampm?Colors.white:Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(4))
                                  ),
                                  child: Center(
                                    child:Text('PM',
                                      style: GoogleFonts.roboto(color: ampm?Colors.grey:Colors.white,fontSize: 12,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 8,),

                  Container(
                    alignment: Alignment.centerLeft,
                    child:
                    Text('Place of Birth',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child:
                  Autocomplete<Placez>(
                  optionsBuilder: (TextEditingValue textEditingValue) async {
                    List<Placez> fxt= await Provider.of<RelationsProvider>(context,listen:false).getplaces(textEditingValue.text);
                  return fxt;
                    // return countryOptions
                  //     .where((Country county) => county.name.toLowerCase()
                  //     .startsWith(textEditingValue.text.toLowerCase())
                  // )
                  //     .toList();
                  },
                  displayStringForOption: (Placez option) => option.placeName,
                  fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted
                  ) {
                  return TextFormField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                    validator: (value) {

                      if (value == null || value.isEmpty ||selectedplace==null) {
                        return 'Please enter Location';
                      }

                        return null;

                    },
                    textInputAction: TextInputAction.next,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration:InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                        ),
                        border:OutlineInputBorder(),
                        hintText: 'Eg: Mysore'),
                  );
                  },
                  onSelected: (Placez selection) {
                  print('Selected: ${selection.placeName}');
                  selectedplace=selection;
                  },
                  optionsViewBuilder: (
                  BuildContext context,
                  AutocompleteOnSelected<Placez> onSelected,
                  Iterable<Placez> options) {
                    return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          child: Container(
                            color: Colors.white,
                            child: ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Placez option = options.elementAt(index);

                                return GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: Wrap(
                                  children:[
                                    ListTile(
                                    title: Text(option.placeName,
                                        style: const TextStyle(color: Colors.black)),
                                    trailing: Icon(Icons.location_on_outlined,color: Colors.grey,),
                                    hoverColor: Colors.blue.shade300,
                                  ),
                                    Container(height: 0.25,color: Colors.orange.shade300,)
                                ])
                                );
                              },
                            ),
                          ),
                        )
                    );
                  }),
                  ),
                  SizedBox(height: 8,),

                  Container(
                  height: 82,
                  width: MediaQuery.of(context).size.width,
                  child:Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          SizedBox(height: 8,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child:
                            Text('Gender',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(height: 8,),

                          DropdownButton(
                          alignment: Alignment.centerLeft,
                          // Initial Value
                          value: dropdownvalue,
                          isExpanded: true,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                          return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                          );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          }

                          ),
                        ],
                      )),
                      SizedBox(width: 24,),
                      Expanded(child: Column(
                        children: [
                          SizedBox(height: 8,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child:
                            Text('Relation',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(height: 8,),

                              DropdownButton(
                                  alignment: Alignment.centerLeft,
                                  value: dropdownvalue2,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items2.map((String items2) {
                                    return DropdownMenuItem(
                                      value: items2,
                                      child: Text(items2),
                                    );
                                  }).toList(),

                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue2 = newValue!;
                                    });
                                  }

                          ),
                        ],
                      ))
                    ],
                  )),






            SizedBox(height: 42,),
                  InkWell(
                    onTap:() async{
                      if(_formKey.currentState!.validate()){
                        if(selectedplace==null){
                          Fluttertoast.showToast(msg: 'Kindly select the birthplace.');
                        }
                        else{
                          BirthDetails mx=BirthDetails(
                              dobDay: int.parse(dayctrler.value.text),
                            dobMonth:int.parse(monthctrler.value.text),
                            dobYear:  int.parse(yearctrler.value.text),
                            tobHour: int.parse(hourctrler.value.text),
                            tobMin: int.parse(mintsctrler.value.text),
                            meridiem: ampm?'AM':'PM',
                          );
                          int relid=items2.indexWhere((element) => element==dropdownvalue2);
                          relid=relid+1;
                          setState(() {
                            loading=true;
                          });
                       addapistat vbx= await Provider.of<RelationsProvider>(context,listen: false).addrelation(mx.toJson(), selectedplace!.toJson(), namectrler.value.text, dropdownvalue,relid);
                       if(vbx==addapistat.success)
                         {
                           Fluttertoast.showToast(msg: 'Profile added successfully.');
                           loading=false;
                           Provider.of<RelationsProvider>(context,listen:false).getrelations();
                           Navigator.pop(context);
                         }
                       else{
                         setState(() {
                           loading=false;
                         });
                         Fluttertoast.showToast(msg: 'Some error happened, Kindly try adding later.');

                       }
                        }
                      }
                    },
                    child:
                    Container(
                      height: 36,
                      width: MediaQuery.of(context).size.width*.25,
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            if(loading)...[
                             SizedBox(height: 20,
                             width: 20,
                             child: Center(
                               child: CircularProgressIndicator(
                                 color: Colors.white,
                               ),
                             ),),
                              SizedBox(width: 4,),
                              Text('Saving...',
                                style: GoogleFonts.roboto(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),
                              ),
                            ],
                            if(!loading)...[
                            Icon(
                              Icons.save_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4,),
                            Text('Save',
                              style: GoogleFonts.roboto(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),
                            ),
                  ]
                          ]),
                    ),
                  ),

                ],
              ),
                  ),
                  ),
            ),

          )
          ),
          ),


        ));


  }
}


