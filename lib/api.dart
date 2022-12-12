import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';


  void sendtodjango(
      {required String email, required String password}) async {
    var endPoint = Uri.http('127.0.0.1:8000', 'accounts/login');
    Map data = {};
    data['test@test.eu']=email;
    data['test']=password;
    try {
      var response = await Client().post(endPoint,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body:convert.json.encode(data));
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      throw (e.toString());
    }
  }