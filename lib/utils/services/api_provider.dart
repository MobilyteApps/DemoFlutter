import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


enum Environment { DEV, PROD }

class ApiProvider {
  //Live
  String baseUrl = "";
  String version = "v1";

  static final ApiProvider _apiProvider = ApiProvider._internal();
  static final Environment _setEnv = Environment.DEV;

  ApiProvider._internal() {
    // initialization logic here

  }

  factory ApiProvider() {
    return _apiProvider;
  }


  Future loginMerchantApi(String username, String password) async {
    Map<String, String> header = new Map();
    header["content-type"] = "application/x-www-form-urlencoded";

    print("login");
    try {
      final response = await http.get(baseUrl ,
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("response login: ${response.body}");

        return null;
      } else if (response.statusCode == 403) {

        return null;
      } else {
        print("response login: ${response.body}");
        return null;
      }
    } catch (e) {
      print("response login: $e");
      return null;
    }
  }


  Future registerMerchantApi(String username, String email, String password) async {
    Map<String, String> header = new Map();
    header["content-type"] = "application/client";

    print("login");
    try {
      final response = await http.get("" ,
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("response login: ${response.body}");

        return null;
      } else if (response.statusCode == 403) {

        return null;
      } else {
        print("response login: ${response.body}");
        return null;
      }
    } catch (e) {
      print("response login: $e");
      return null;
    }
  }

}
