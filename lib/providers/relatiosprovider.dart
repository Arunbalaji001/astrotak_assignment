import 'dart:io';

import 'package:astrotak_assignment/models/askaquestion.dart';
import 'package:astrotak_assignment/models/place.dart';
import 'package:astrotak_assignment/models/relation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum apistat{initial,loading,success,error}
enum addapistat{initial,loading,success,error}

class RelationsProvider extends ChangeNotifier{
  apistat xty=apistat.initial;
  addapistat jty=addapistat.initial;
  Dataz? xtz=null;
  Relatives? selectedrelative;

  void setrelative(Relatives xzp){
    selectedrelative=xzp;
    Future.delayed(Duration.zero,(){
      notifyListeners();
    });
  }
  Relatives? getRelative()=>selectedrelative;


  RelationsProvider(){
    getrelations();
  }
  Future<void> getrelations() async {
    try {
      xty=apistat.loading;
      notifyListeners();
      final response = await http.get(
        Uri.parse("https://staging-api.astrotak.com/api/relative/all"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
        },
      );


      if (response.statusCode == 200) {
        final valx = json.decode(response.body);
        if(valx!=null&&valx['data']!=null) {
          xtz = Dataz.fromJson(valx['data']);
          xty = apistat.success;
          notifyListeners();
        }
        else{
          xty=apistat.error;
          notifyListeners();
        }
      }
      else {
        xty=apistat.error;
        notifyListeners();
      }
    } catch (e) {
      xty=apistat.error;
      notifyListeners();
      rethrow;
    }
  }
  Future<List<Placez>> getplaces(String srchstrg) async {
    try {

      final response = await http.get(
        Uri.parse("https://staging-api.astrotak.com/api/location/place?inputPlace="+srchstrg),
        // headers: {
        //   HttpHeaders.contentTypeHeader: "application/json",
        //   'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
        // },
      );
        List<Placez> xj=[];

      if (response.statusCode == 200) {
        final valx = json.decode(response.body);
        if(valx!=null&&valx['data']!=null) {
          for(var xc in valx['data'])
            {
              Placez dx=Placez.fromJson(xc);
              xj.add(dx);
            }

         return xj;
        }
        else{
          return xj;
        }
      }
      else {
        return xj;

      }
    } catch (e) {
      List<Placez> xj=[];
      return xj;

    }
  }


  Future<addapistat> addrelation(dynamic bithdtls,dynamic placex,String name,String gender,int relid) async {
    try {
      jty=addapistat.loading;
      notifyListeners();
      final response = await http.post(
        Uri.parse("https://staging-api.astrotak.com/api/relative"),
        body: jsonEncode(<String, dynamic>{
          'birthDetails': bithdtls,
          'birthPlace':placex,
          'firstName':name,
          'lastName':name,
          'relationId':relid,
          'gender':gender
        }),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
        },

      );

      print(json.decode(response.body).toString());
      if (response.statusCode == 200) {
        final valx = json.decode(response.body);
        print(json.decode(response.body).toString());
        return addapistat.success;

      }
      else {
        var x=json.decode(response.body);
        Fluttertoast.showToast(msg: x['message']);
        return addapistat.error;

      }
    } catch (e) {
      print('Exception ==> '+e.toString());
      return addapistat.error;

    }
  }

  Future<addapistat> updaterelation() async {
    try {
      jty=addapistat.loading;
      notifyListeners();
      final response = await http.post(
        Uri.parse("https://staging-api.astrotak.com/api/relative/update/"+selectedrelative!.uuid.toString()),
        body: jsonEncode(selectedrelative),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
        },

      );

      print(json.decode(response.body).toString());
      if (response.statusCode == 200) {
        final valx = json.decode(response.body);
        print(json.decode(response.body).toString());
        return addapistat.success;

      }
      else {
        var x=json.decode(response.body);
        Fluttertoast.showToast(msg: x['message']);
        return addapistat.error;

      }
    } catch (e) {
      print('Exception ==> '+e.toString());
      return addapistat.error;

    }
  }


  Future<void> deleterelation(String uuid) async {
    try {
      var contains=xtz!.allRelatives!.where((element) => element.uuid==uuid);
      if(contains!=null)
        {
          xtz!.allRelatives!.singleWhere((element) => element.uuid==uuid).deleting=true;
          notifyListeners();

      final response = await http.post(
        Uri.parse("https://staging-api.astrotak.com/api/relative/delete/"+uuid),

        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
        },

      );

      if (response.statusCode == 200) {
        final valx = json.decode(response.body);
        print(json.decode(response.body).toString());
        xtz!.allRelatives!.removeWhere((element) => element.uuid==uuid);
        notifyListeners();
      }
      else {
        var x=json.decode(response.body);
        Fluttertoast.showToast(msg: x['message']);
      }
        }
      else{
        Fluttertoast.showToast(msg: 'Error : Unable to delete.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error : Unable to delete.');
      print('Exception ==> '+e.toString());
      rethrow;
    }
  }



}
