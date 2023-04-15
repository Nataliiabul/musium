import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:musium/helpers/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  String? _username;

  bool get isAuth {
    return _token != null && _token != "null";
  }

  String get userName {
    return _username ?? 'unknown';
  }

  Future<void> registration(
      String username, String email, String password) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${dotenv.env['WEBAPIKEY']}');
    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId']; // id
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      url = Uri.parse('${dotenv.env['REALTIMEDATABASE']}users/$_userId/information.json');
      response = await http.post(
        url, 
        body: json.encode({
          'email': email,
          'username': username,
        },),
      );
      _username = username;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> auth (String email, String password) async {
    var url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${dotenv.env['WEBAPIKEY']}');
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },),
      );
      var responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId']; // id
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      url = Uri.parse('${dotenv.env['REALTIMEDATABASE']}users/$_userId/information.json');
      response = await http.get(url);
      responseData = json.decode(response.body);
      responseData.forEach((bdNum, userInformation){
        _username = userInformation['username'];
      });
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
