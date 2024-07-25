

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/global/global.dart';

Future<void> updateLoginStatus(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLoggedIn", value);
  prefs.setString("phoneNum", phoneNumber!);
}
