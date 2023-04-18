import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:musium/helpers/http_exception.dart';
import 'package:musium/screens/sign_in_screen.dart';
import 'package:musium/screens/tabs_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      url = Uri.parse(
          '${dotenv.env['REALTIMEDATABASE']}users/$_userId/information.json');
      response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'username': username,
          },
        ),
      );
      _username = username;
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate!.toIso8601String(),
          'username': _username,
        },
      );
      prefs.setString('userData', userData);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> auth(String email, String password) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${dotenv.env['WEBAPIKEY']}');
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
      url = Uri.parse(
          '${dotenv.env['REALTIMEDATABASE']}users/$_userId/information.json');
      response = await http.get(url);
      responseData = json.decode(response.body);
      responseData.forEach((bdNum, userInformation) {
        _username = userInformation['username'];
      });
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate!.toIso8601String(),
          'username': _username,
        },
      );
      prefs.setString('userData', userData);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
       return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    _username = extractedUserData['username'];
    notifyListeners();
    return true;
  }

  Future <void> logOut() async {
    _token = null;
    _expiryDate = null;
    _userId = null;
    _username = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
