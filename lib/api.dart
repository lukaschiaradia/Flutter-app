import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:Notario/connexion_page.dart';
import 'package:http/http.dart';

var firstName = '';
var LastName = '';
var email = '';
var password = '';
var password_confirm = '';
var age = '';

Future<num> api_login({required String email, required String password}) async {
  var endPoint = Uri.http('127.0.0.1:8000', '/accounts/login/');
  Map data = {};
  print(mail);
  data['email'] = email;
  data['password'] = password;
  try {
    var response = await Client().post(endPoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.json.encode(data));
    print(response.body);
    print(response.statusCode);
    return await (response.statusCode);
  } catch (e) {
    throw (e.toString());
  }
}

Future<num> api_register(
    {required String email,
    required String password,
    required String password_confirm,
    required String phone,
    required String firstName,
    required String LastName,
    required String age}) async {
  var endPoint = Uri.http('127.0.0.1:8000', '/accounts/register/');
  num int_age = int.parse(age);
  Map data = {};
  data['email'] = email;
  data['password'] = password;
  data['age'] = int_age;
  data['firstName'] = firstName;
  data['LastName'] = LastName;
  data['phone'] = phone;
  if (password == password_confirm)
    data['password_confirm'] = password_confirm;
  else
    print("passwords don't match");
  try {
    var response = await Client().post(endPoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.json.encode(data));
    print(response.body);
    print(response.statusCode);
    return await (response.statusCode);
  } catch (e) {
    throw (e.toString());
  }
}
