import 'dart:io';

import 'package:astrotak_assignment/models/askaquestion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum apistat{initial,loading,success,error}

class QuestionProvider extends ChangeNotifier{
  apistat vty=apistat.initial;
  askaquestionmodel? questioncategories;
  QuestionProvider();

  Future<void> setselected(String text) async{
    if(questioncategories!=null) {
      List<Data> bvx=[];
      bvx=questioncategories!.data!.toList();
      for (var x in bvx) {
          if(x.name==text)
            {
              x.selected=true;
            }
          else{
            x.selected=false;
          }
      }
      questioncategories!.data=bvx;
      notifyListeners();
    }
  }

  Future<void> getcatgs() async {
    try {
      vty=apistat.loading;
      notifyListeners();
      final response = await http.get(
        Uri.parse("https://staging-api.astrotak.com/api/question/category/all"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final valx = json.decode(response.body);
        questioncategories=askaquestionmodel.fromJson(valx);
        vty=apistat.success;
        notifyListeners();
        }
       else {
        vty=apistat.error;
        notifyListeners();
      }
    } catch (e) {
      print('Exception ==> '+e.toString());
      vty=apistat.error;
      notifyListeners();
      rethrow;
    }
  }

}
