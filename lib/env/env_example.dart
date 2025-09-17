// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const BASE_URL_API = "https://hoho.io/api/v1";
const BASE_URL_IMAGE = "https://hoho.io";
const TQUIZ_KEY = "";

String COOKIE = "";

Future getCookie() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? cookieValue = prefs.getString('cookie');
  if (cookieValue != null) {
    COOKIE = cookieValue;
  }
  return COOKIE;
}

Future<void> updateCookie(String? newCookie) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('cookie', newCookie!);

  COOKIE = newCookie;
}
