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

var json_map = '';
var age = '';
var token = '';
var json_info = {};
dynamic rdv_list = [];
dynamic faq_list = [];
dynamic chats_list = [];
dynamic chat_List = [];
dynamic chat_id = [];
dynamic chat_with_messages = [];
dynamic all_messages = [];

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
    var json_response = response.body;
    var decode = utf8.decode(json_response.runes.toList());
    var json_map = json.decode(decode);
    json_info = json_map;
    token = json_map['token'];
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
    var json_response = response.body;
    var decode = utf8.decode(json_response.runes.toList());
    var json_map = json.decode(decode);
    token = json_map['token'];
    print(response.statusCode);
    return await (response.statusCode);
  } catch (e) {
    throw (e.toString());
  }
}

Future<dynamic> api_get_planning({required String token}) async {
  var endPoint = Uri.http('127.0.0.1:8000', '/planning/');
  try {
    var response = await Client().get(endPoint, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    });
    var json_response = response.body;
    var decode = utf8.decode(json_response.runes.toList());
    var json_map = json.decode(decode);
    print(response.statusCode);
    rdv_list = json_map;
    print("json_map");
    print(json_map);
    return await json_map;
  } catch (e) {
    throw (e.toString());
  }
}

Future<dynamic> api_get_questions() async {
  var endPoint = Uri.http('127.0.0.1:8000', '/faq/');
  try {
    var response = await Client().get(endPoint, headers: <String, String>{
      'Content-Type': 'application/json',
    });
    var json_response = response.body;
    var decode = utf8.decode(json_response.runes.toList());
    var json_map = json.decode(decode);
    rdv_list = json_map;
    return await json_map;
  } catch (e) {
    throw (e.toString());
  }
}

Future<dynamic> api_get_chats() async {
  var endPoint = Uri.http('127.0.0.1:8000', '/chat/');
  try {
    var response = await Client().get(endPoint, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    });
    var json_map = json.decode(response.body);
    print(response.statusCode);
    chats_list = json_map;
    print("json_map of chats");
    print(json_map);
    return await json_map;
  } catch (e) {
    throw (e.toString());
  }
}

List<dynamic> create_chat_list(List chats_list) {
  List<dynamic> chat_List = [];
  for (int x = 0; x < chats_list.length; x++) {
    chat_List = [
      ...chat_List,
      {
        'chat_id': chats_list[x]['id'],
        'receiver': chats_list[x]['user_name'],
        'id_receiver': chats_list[x]['user_id'],
      }
    ];
  }
  return chat_List;
}

Future<dynamic> api_get_chat(chatId) async {
  print(chatId);
  var endPoint = Uri.http('127.0.0.1:8000', '/chat/$chatId');
  try {
    var response = await Client().get(endPoint, headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    });
    var json_map = json.decode(response.body);
    print(response.statusCode);
    chat_with_messages = json_map;
    return await json_map;
  } catch (e) {
    throw (e.toString());
  }
}

List<dynamic> create_messages_list(List chat_with_messages) {
  List<dynamic> messages = [];
  for (int x = 0; x < chat_with_messages.length; x++) {
    messages = [
      ...messages,
      {
        'sender': chat_with_messages[x]['sender'],
        'receiver': chat_with_messages[x]['receiver'],
        'message': chat_with_messages[x]['text'],
      }
    ];
  }
  return messages;
}
