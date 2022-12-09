import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

  @override
  Future<Map<String, String>> sendtodjango(
      {String username, String password}) async {
    }) async {
    var endPoint = Uri.http('http://127.0.0.1:8000/accounts/login');
    Map data = {};
    String username = "test";
    String password = "test";
    data['name']=username;
    data['file']=password;
    try {
      var response = await http.post(endPoint,headers: yourRequestHeaders, body:convert.json.encode(data));
    } catch (e) {
      throw (e.toString());
    }
  }