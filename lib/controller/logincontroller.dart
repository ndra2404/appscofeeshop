import 'dart:convert';
import 'package:appscoffeshop/Helpers/api.dart';
import 'package:appscoffeshop/config/config.dart';
import 'package:appscoffeshop/models/login.dart';

class LoginController {
  static Future<Login> login({String? email, String? password}) async {
    String apiurl = config.login;
    var response =
        await Api().post(apiurl, {"email": email, "password": password});
    var jsonData = json.decode(response.body);
    return Login.fromJson(jsonData);
  }
}
