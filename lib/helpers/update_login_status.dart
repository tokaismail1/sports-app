import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/global/global.dart';

Future<void> updateLoginStatus(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Use a null check with a fallback default value
  String phone = phoneNumber ?? 'defaultPhoneNumber';  // Provide a default value or handle null case

  prefs.setBool("isLoggedIn", value);
  prefs.setString("phoneNum", phone);
}
